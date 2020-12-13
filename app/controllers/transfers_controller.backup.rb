class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  def index
    @transfers = Transfer.all
    @sites = Site.all
    @stocks = Stock.all
    @active = Transfer.active?
    @expired = Transfer.expired?
  end

  def old
    @inactive = Transfer.inactive?
  end

  def renew
    @current_user = current_user
    @transfer = Transfer.find_by_id(params[:id])
    Transfer.renew(params[:id])
    redirect_to :root
    flash[:notice] = "Renewed for 7 days from now. Enjoy!"

    begin
      TransferMailer.delay.renew_transfer(@transfer, @current_user).deliver
    rescue Exception => e
    end
  end

  def disable
    # delivered_qty = Transfer.find_by_id(params[:id]).quantity.to_i
    @delivered_stock = Transfer.find_by_id(params[:id]).stock
    @current_user = current_user
    @transfer = Transfer.find_by_id(params[:id])
    Transfer.disable(params[:id])
    redirect_to :root
    flash[:notice] = "Stock marked as received. Thank you!"

    begin
      TransferMailer.delay.return_transfer(@transfer, @current_user).deliver
    rescue Exception => e
    end
  end

  def new
    @transfer = Transfer.new
    @site = Site.all
  end

  def create
    if Stock.find_by_id(params[:transfer][:stock_id]).quantity >= params[:transfer][:quantity].to_i
      params[:transfer][:status] = true
      @transfer = Transfer.new(transfer_params)
      if @transfer.save
        @current_user = current_user
        @borrowed_stock = Stock.find_by_id(params[:transfer][:stock_id])
        @borrowed_stock.decrement!(:quantity, params[:transfer][:quantity].to_i)
        redirect_to :root, notice: 'Transfer was successfully created.'
        begin
          TransferMailer.delay.create_transfer(@transfer, @current_user).deliver
        rescue Exception => e
        end
      else
        render :new
      end
    else
      flash[:alert] = 'The quantity you entered is not currently available'
      redirect_to :back
    end
  end

  def destroy
    borrowed_qty = @transfer.quantity.to_i
    @borrowed_stock = @transfer.stock
    @borrowed_stock.increment!(:quantity, borrowed_qty)
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
      params.require(:transfer).permit(:quantity, :expire_at, :status, :stock_id, :origin, :destination)
    end
end
