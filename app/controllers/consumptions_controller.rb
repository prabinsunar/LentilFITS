class ConsumptionsController < ApplicationController
    def index
        @stocks = Stock.where(site: current_user.site.id).where("quantity > 0")
    end
    
    def new
        @consumption = Consumption.new
        @stock = Stock.find(params[:stock])
    end
    
    def list
        @consumption = Consumption.where(site: current_user.site.id)
    end
    
    def allview
        @consumptions = Consumption.all
    end
    
    def create
      stock_quantity = Stock.find_by_id(params[:consumption][:stock_id]).quantity
      consumptions_quantity = params[:consumption][:quantity].to_f
        if stock_quantity >= consumptions_quantity && consumptions_quantity > 0
          @consumption = Consumption.new(consumptions_params)
          if @consumption.save
            @borrowed_stock = Stock.find_by_id(params[:consumption][:stock_id])
            @borrowed_stock.decrement!(:quantity, params[:consumption][:quantity].to_f)
            redirect_to consumptions_list_path, notice: 'Consumption successfully created.'
          else
            render :new
          end
        else
          if consumptions_quantity <= 0
            flash[:alert] = 'Quantity should be greater than zero'
            redirect_to :back
          else
            flash[:alert] = 'The quantity you entered is not currently available'
            redirect_to :back
          end
        end
    end
  
  private
    def consumptions_params
      params.require(:consumption).permit(:quantity, :stock_id, :site_id)
    end
end
