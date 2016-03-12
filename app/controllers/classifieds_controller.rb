class ClassifiedsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_classified, only: [:show, :edit, :update, :destroy]

  # GET /classifieds
  # GET /classifieds.json
  def index
    if params[:tag]
      @classifieds = Classified.includes(:user).paginate(page: params[:page], per_page: 5).tagged_with(params[:tag])
      @page_header =  "its all about #{params[:tag].to_s}"
    else
      @classifieds = Classified.includes(:user).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /classifieds/1
  # GET /classifieds/1.json
  def show
  end

  # GET /classifieds/new
  def new
    redirect_to sign_up_path unless user_signed_in?
    @classified = Classified.new
  end

  # GET /classifieds/1/edit
  def edit
  end

  # POST /classifieds
  # POST /classifieds.json
  def create
    @classified = current_user.classifieds.build(classified_params)

    respond_to do |format|
      if @classified.save
        format.html { redirect_to root_url, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @classified }
      else
        format.html { render :new }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifieds/1
  # PATCH/PUT /classifieds/1.json
  def update
    if @classified.user == current_user
    respond_to do |format|
      if @classified.update(classified_params)
        format.html { redirect_to @classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified }
      else
        format.html { render :edit }
        format.json { render json: @classified.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /classifieds/1
  # DELETE /classifieds/1.json
  def destroy
    if @classified.user == current_user
      @classified.destroy
      respond_to do |format|
        format.html { redirect_to classifieds_url, notice: 'Classified was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def search
    @classifieds = Classified.where(["lower(title) like ?", "%" + params[:search].downcase + "%"])
    if params['search'].to_s.size < 1
      redirect_to root_url, alert: "You just search for nothing?"
    else
      render :search
    end
  end

  def image 
    @image = Classified.friendly.find(params[:id])
    send_data @image.file_contents, filename: @image.filename, type: @image.content_type, :diposition => "inline"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified
      @classified = Classified.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_params
      params.require(:classified).permit(:title, :price, :location, :description, :file, :category_id, :all_tags)
    end
end
