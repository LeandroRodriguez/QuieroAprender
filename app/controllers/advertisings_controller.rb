class AdvertisingsController < ApplicationController
	 before_action :set_advertising, only: [:show, :edit, :update, :destroy]

  # GET /advertisings
  # GET /advertisings.json
  def index
    @advertisings = Advertising.all
  end

  # GET /advertisings/1
  # GET /advertisings/1.json
  def show
   @advertising = Advertising.find(params[:id])
  end

  # GET /advertisings/new
  def new
    @advertising = Advertising.new
    @posibleTags=Tag.all.map{|a| a.name}
    @selectedTags=[]
  end

  # GET /advertisings/1/edit
  def edit
    @advertising = Advertising.find(params[:id])
  end

  # POST /advertisings
  # POST /advertisings.json
  def create
    @advertising = Advertising.new(advertising_params)
    setTags(@advertising)
    respond_to do |format|
      if @advertising.save
        format.html { redirect_to @advertising, notice: 'Advertising was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advertising }
      else
        format.html { render action: 'new' }
        format.json { render json: @advertising.errors, status: :unprocessable_entity }
      end
    end
  end
  def setTags(advertising)
    params[:selectedTags].gsub!(/\s/,'')
      tags = params[:selectedTags].split(',')
      tags.each do |t|
          tag = Tag.find_by_name(t)
          @advertising.tags << tag
      end 
  end

  # PATCH/PUT /advertisings/1
  # PATCH/PUT /advertisings/1.json
  def update
    @advertising = Advertising.find(params[:id])
    respond_to do |format|
      if @advertising.update(advertising_params)
        format.html { redirect_to @advertising, notice: 'advertising was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advertising.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisings/1
  # DELETE /advertisings/1.json
  def destroy
    @advertising = Advertising.find(params[:id])
    @advertising.destroy
    respond_to do |format|
      format.html { redirect_to advertisings_url }
      format.json { head :no_content }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_advertising
 #     @advertising = advertising.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertising_params
      params.require(:advertising).permit(:name, :description, :address, :price, :tags)
    end
end

