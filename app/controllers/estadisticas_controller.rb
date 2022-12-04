class EstadisticasController < ApplicationController
  before_action :set_estadistica, only: %i[ show edit update destroy ]

  # GET /estadisticas or /estadisticas.json
  def index
    @estadisticas = Estadistica.all
  end

  # GET /estadisticas/1 or /estadisticas/1.json
  def show
  end

  # GET /estadisticas/new
  def new
    @estadistica = Estadistica.new
  end

  # GET /estadisticas/1/edit
  def edit
  end

  # POST /estadisticas or /estadisticas.json
  def create
    @estadistica = Estadistica.new(estadistica_params)

    respond_to do |format|
      if @estadistica.save
        format.html { redirect_to estadistica_url(@estadistica), notice: "Estadistica was successfully created." }
        format.json { render :show, status: :created, location: @estadistica }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estadistica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estadisticas/1 or /estadisticas/1.json
  def update
    respond_to do |format|
      if @estadistica.update(estadistica_params)
        format.html { redirect_to estadistica_url(@estadistica), notice: "Estadistica was successfully updated." }
        format.json { render :show, status: :ok, location: @estadistica }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estadistica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadisticas/1 or /estadisticas/1.json
  def destroy
    @estadistica.destroy

    respond_to do |format|
      format.html { redirect_to estadisticas_url, notice: "Estadistica was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadistica
      @estadistica = Estadistica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estadistica_params
      params.fetch(:estadistica, {})
    end
end
