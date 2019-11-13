class GfsController < ApplicationController
  before_action :set_gf, only: [:show, :edit, :update, :destroy]

  # GET /gfs
  # GET /gfs.json
  def index
    @gfs = Gf.all
  end

  # GET /gfs/1
  # GET /gfs/1.json
  def show
  end

  # GET /gfs/new
  def new
    @gf = Gf.new
  end

  # GET /gfs/1/edit
  def edit
  end

  # POST /gfs
  # POST /gfs.json
  def create
    @gf = Gf.new(gf_params)

    respond_to do |format|
      if @gf.save
        format.html { redirect_to @gf, notice: 'Gf was successfully created.' }
        format.json { render :show, status: :created, location: @gf }
      else
        format.html { render :new }
        format.json { render json: @gf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gfs/1
  # PATCH/PUT /gfs/1.json
  def update
    respond_to do |format|
      if @gf.update(gf_params)
        format.html { redirect_to @gf, notice: 'Gf was successfully updated.' }
        format.json { render :show, status: :ok, location: @gf }
      else
        format.html { render :edit }
        format.json { render json: @gf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gfs/1
  # DELETE /gfs/1.json
  def destroy
    @gf.destroy
    respond_to do |format|
      format.html { redirect_to gfs_url, notice: 'Gf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gf
      @gf = Gf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gf_params
      params.require(:gf).permit(:url, :state)
    end
end
