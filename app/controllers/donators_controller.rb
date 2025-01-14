class DonatorsController < ApplicationController
  before_action :set_donator, only: [:show, :edit, :update, :destroy]

  # GET /donators
  # GET /donators.json
  def index
    @donators = Donator.all
  end

  # GET /donators/1
  # GET /donators/1.json
  def show
  end

  # GET /donators/new
  def new
    @donator = Donator.new
  end

  # GET /donators/1/edit
  def edit
  end

  # POST /donators
  # POST /donators.json
  def create
    @donator = Donator.new(donator_params)
    if @donator.save
      redirect_to :root, notice: 'Donator was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donators/1
  # PATCH/PUT /donators/1.json
  def update
    if @donator.update(donator_params)
      redirect_to :root, notice: 'Donator was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donators/1
  # DELETE /donators/1.json
  def destroy
    @donator.destroy
    respond_to do |format|
      format.html { redirect_to donators_url, notice: 'Donator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donator
      @donator = Donator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def donator_params
      params.require(:donator).permit(:name, :address, :phone)
    end
end
