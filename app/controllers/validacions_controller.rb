class ValidacionsController < ApplicationController
  before_action :set_validacion, only: %i[ create show edit update destroy ]

  # GET /validacions or /validacions.json
  def index
    @validacions = Validacion.all
  end

  # GET /validacions/1 or /validacions/1.json
  def show
  end

  # GET /validacions/new
  def new
    @validacion = Validacion.new
  end

  # GET /validacions/1/edit
  def edit
  end

  # POST /validacions or /validacions.json
  def create
    @validacion = Validacion.new(validacion_params)

    respond_to do |format|
      if @validacion.save
        format.html { redirect_to validacion_url(@validacion), notice: "Validacion was successfully created." }
        format.json { render :show, status: :created, location: @validacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @validacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /validacions/1 or /validacions/1.json
  def update
    respond_to do |format|
      if @validacion.update(validacion_params)
        format.html { redirect_to validacion_url(@validacion), notice: "Validacion was successfully updated." }
        format.json { render :show, status: :ok, location: @validacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @validacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validacions/1 or /validacions/1.json
  def destroy
    @validacion.destroy

    respond_to do |format|
      format.html { redirect_to validacions_url, notice: "Validacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_validacion
      @validacion = Validacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def validacion_params
      params.require(:validacion).permit(:image)
    end
end
