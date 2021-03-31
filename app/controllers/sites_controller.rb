require 'scrape'

class SitesController < ApplicationController
  include Scrape
  before_action :set_site, only: %i[ show edit update destroy ]

  def all_sites
    @user = current_user
    @sites = Site.all.order("created_at DESC")
    # @sites = Site.where(user_id: @user).order("created_at ASC")
  end

  # GET /sites or /sites.json
  def index
    @user = User.find(params[:user_id])
    @sites = @user.sites.order("created_at DESC")
  end

  # GET /sites/1 or /sites/1.json
  def show
    @site = Site.find(params[:id])
  end

  # GET /sites/new
  def new
    @site = Site.new
    @user = User.find(params[:user_id])
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @user = current_user
    @site = Site.new(site_params)

    get_site(params[:site][:link])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: "Site was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to user_sites_path(current_user), notice: "Site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:link, :title, :thumbnail_link, :description, :keyword_list, :user_id)
    end
end
