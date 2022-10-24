class SusController < ApplicationController
  before_action :set_su, only: %i[ show edit update destroy ]

  # GET /sus or /sus.json
  def index
    @sus = Su.all
  end

  # GET /sus/1 or /sus/1.json
  def show
  end

  # GET /sus/new
  def new
    @su = Su.new
  end

  # GET /sus/1/edit
  def edit
  end

  # POST /sus or /sus.json
  def create
    @su = Su.new(su_params)

    respond_to do |format|
      if @su.save
        format.html { redirect_to su_url(@su), notice: "Su was successfully created." }
        format.json { render :show, status: :created, location: @su }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @su.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sus/1 or /sus/1.json
  def update
    respond_to do |format|
      if @su.update(su_params)
        format.html { redirect_to su_url(@su), notice: "Su was successfully updated." }
        format.json { render :show, status: :ok, location: @su }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @su.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sus/1 or /sus/1.json
  def destroy
    @su.destroy

    respond_to do |format|
      format.html { redirect_to sus_url, notice: "Su was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_su
      @su = Su.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def su_params
      params.require(:su).permit(:name, :surname, :dni)
    end
end
