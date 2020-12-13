class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_url, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to sites_url, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @site.transfers.where(status: true).count == 0
      @site.destroy
      redirect_to sites_url, notice: 'Site was successfully destroyed.'
    else
      flash[:alert] = 'Sites with active transfers can not be deleted. Mark his/hers open transfers as returned and try again.'
      redirect_to root_url
    end
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:name, :address, :phone)
    end
end
