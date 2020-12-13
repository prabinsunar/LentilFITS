class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
    @stocks = Stock.all
    @available = Stock.where(site: current_user.site.id).where("quantity > 0")
    @active = Transfer.where(destination: current_user.site.name, status: true).or(Transfer.where(origin: current_user.site.name, status: true))
    #the or condition above allows to see if the site is in either the original site or the destination site
    #original (status: true, destination: current_user.site.name)
    @expired = Transfer.expired?
    @donator = Donator.all
  end
  
  def list
    @stocks = Stock.where(site: current_user.site.id).where("quantity > 0")
  end

  def old
    @inactive = Transfer.where(status: false, destination: current_user.site.name)
  end
  
  def allold
    @inactive = Transfer.where(status: false)
  end
  
  def receive
    # transferred_qty = Transfer.find_by_id(params[:id]).quantity.to_i
    @transferred_stock = Transfer.find_by_id(params[:id]).stock
    @current_user = current_user
    @transfer = Transfer.find_by_id(params[:id])
    Stock.create(name: @transfer.stock.name, quantity: @transfer.quantity, size_id: @transfer.stock.size_id, description: @transfer.stock.description,
                  site_id: current_user.site_id, category_id: @transfer.stock.category_id, donator_id: @transfer.stock.donator_id)
    Transfer.receive(params[:id]) # Taken from Transfer model to update the status of transfer into false/0/inactive
    redirect_to :root
    flash[:notice] = "Received! Item has been added to the stock"
    begin
      TransferMailer.delay.return_transfer(@transfer, @current_user).deliver
    rescue Exception => e
    end
  end

  def new
    @transfer = Transfer.new
    @site = Site.all
    @stock = Stock.find(params[:stock])
    @donator = Donator.all
  end

  def create
    stock_quantity = Stock.find_by_id(params[:transfer][:stock_id]).quantity
    transfer_quantity = params[:transfer][:quantity].to_i
    if stock_quantity >= transfer_quantity && transfer_quantity > 0
      params[:transfer][:status] = true # Make the transfer become active when new transfer is created
      @transfer = Transfer.new(transfer_params)
      if @transfer.save
        @current_user = current_user
        @transferred_stock = Stock.find_by_id(params[:transfer][:stock_id])
        @transferred_stock.decrement!(:quantity, params[:transfer][:quantity].to_i)
        redirect_to :root, notice: 'Transfer was successfully created.'
      else
        render :new
      end
    else
      if transfer_quantity <= 0
          flash[:alert] = 'Quantity should be greater than zero'
          redirect_to :back
      else
          flash[:alert] = 'The quantity you entered is not currently available'
          redirect_to :back
      end
    end
  end

  def destroy
    transferred_qty = @transfer.quantity.to_i
    @transferred_stock = @transfer.stock
    @transferred_stock.increment!(:quantity, transferred_qty)
    @current_user = current_user
    @transfer.destroy

    redirect_to transfers_url, notice: 'Transfer was successfully destroyed.'
    begin
      TransferMailer.delay.cancel_transfer(@transfer, @current_user).deliver
    rescue Exception => e
    end
  end

  private
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    def transfer_params
      params.require(:transfer).permit(:quantity, :expire_at, :destination, :origin, :status, :stock_id, :site_id)
    end
end
