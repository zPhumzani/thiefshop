class Admin::ClassifiedsController < Admin::ApplicationController
  before_action :set_admin_classified, only: [:show, :edit, :update, :destroy]

  # GET /admin/classifieds
  # GET /admin/classifieds.json
  def index
    @admin_classifieds = Classified.all
  end

  # GET /admin/classifieds/1
  # GET /admin/classifieds/1.json
  def show
  end

  # GET /admin/classifieds/new
  def new
    @admin_classified = Classified.new
  end

  # GET /admin/classifieds/1/edit
  def edit
  end

  # POST /admin/classifieds
  # POST /admin/classifieds.json
  def create
    @admin_classified = Classified.new(admin_classified_params)

    respond_to do |format|
      if @admin_classified.save
        format.html { redirect_to @admin_classified, notice: 'Classified was successfully created.' }
        format.json { render :show, status: :created, location: @admin_classified }
      else
        format.html { render :new }
        format.json { render json: @admin_classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/classifieds/1
  # PATCH/PUT /admin/classifieds/1.json
  def update
    respond_to do |format|
      if @admin_classified.update(admin_classified_params)
        format.html { redirect_to @admin_classified, notice: 'Classified was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_classified }
      else
        format.html { render :edit }
        format.json { render json: @admin_classified.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/classifieds/1
  # DELETE /admin/classifieds/1.json
  def destroy
    @admin_classified.destroy
    respond_to do |format|
      format.html { redirect_to admin_classifieds_url, notice: 'Classified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_classified
      @admin_classified = Classified.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_classified_params
      params.require(:admin_classified).permit(:title, :price, :location, :description, :category_id, :slug, :all_tags)
    end
end
