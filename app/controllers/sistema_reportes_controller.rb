class SistemaReportesController < ApplicationController
  before_action :set_sistema_reporte, only: %i[ show edit update destroy ]

  # GET /sistema_reportes or /sistema_reportes.json
  def index
    @sistema_reportes = SistemaReporte.all
  end

  # GET /sistema_reportes/1 or /sistema_reportes/1.json
  def show
  end

  # GET /sistema_reportes/new
  def new
    @sistema_reporte = SistemaReporte.new
  end

  # GET /sistema_reportes/1/edit
  def edit
  end

  # POST /sistema_reportes or /sistema_reportes.json
  def create
    @sistema_reporte = SistemaReporte.new(sistema_reporte_params)

    respond_to do |format|
      if @sistema_reporte.save
        format.html { redirect_to sistema_reporte_url(@sistema_reporte), notice: "Sistema reporte was successfully created." }
        format.json { render :show, status: :created, location: @sistema_reporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sistema_reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sistema_reportes/1 or /sistema_reportes/1.json
  def update
    respond_to do |format|
      if @sistema_reporte.update(sistema_reporte_params)
        format.html { redirect_to sistema_reporte_url(@sistema_reporte), notice: "Sistema reporte was successfully updated." }
        format.json { render :show, status: :ok, location: @sistema_reporte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sistema_reporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sistema_reportes/1 or /sistema_reportes/1.json
  def destroy
    @sistema_reporte.destroy

    respond_to do |format|
      format.html { redirect_to sistema_reportes_url, notice: "Sistema reporte was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def atender
    @sistema_reporte = SistemaReporte.find(params[:id])
    @sistema_reporte.update(su_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to sistema_reportes_url, notice: "" }
      format.json { head :no_content }
    end
  end

  def desatender
    @sistema_reporte = SistemaReporte.find(params[:id])
    @sistema_reporte.update(su_id: "")

    respond_to do |format|
      format.html { redirect_to sistema_reportes_url, notice: "" }
      format.json { head :no_content }
    end
  end

  def finalizar
    @sistema_reporte =  SistemaReporte.find(params[:id])  
    @sistema_reporte.update(finalizado: true)

    respond_to do |format|
      format.html { redirect_to sistema_reportes_url, notice: "" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sistema_reporte
      @sistema_reporte = SistemaReporte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sistema_reporte_params
      params.require(:sistema_reporte).permit(:user_id, :descripcion, :severidad, :alquiler_id, images: [] )
      # el parametro images tiene que ir ultimo si o si
    end
end
