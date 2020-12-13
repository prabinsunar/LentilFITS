class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.where(site: current_user.site.id).where("quantity > 0")
    @sites = Site.all
    @categories = Category.all
    @sizes = Size.all
    @donators = Donator.all
  end
  
  def allstock
    @stocks = Stock.where("quantity > 0")
  end

  def new
    @stock = Stock.new
    @site = Site.all
    @category = Category.all
    @size = Size.all
    @donator = Donator.all
  end

  def edit
    @category = Category.all
    @size = Size.all
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to stocks_url, notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  def update
    if @stock.update(stock_params)
      redirect_to stocks_url, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

  private
  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:name, :category_id, :size_id, :description, :quantity, :site_id, :donator_id)
  end
end
