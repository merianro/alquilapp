class ParametrosController < ApplicationController
  before_action :set_parametro, only: %i[ show edit update destroy ]

  # GET /parametros or /parametros.json
  def index
    @parametros = Parametro.all
  end

  # GET /parametros/1 or /parametros/1.json
  def show
  end

  # GET /parametros/new
  def new
    @parametro = Parametro.new
  end

  # GET /parametros/1/edit
  def edit
  end

  # POST /parametros or /parametros.json
  def create
      @parametro = Parametro.new(parametro_params)

      respond_to do |format|
        if @parametro.save
          format.html { redirect_to parametros_url, notice: "Parametro creado con exito!." }
          format.json { render :index, status: :created, location: @parametro }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @parametro.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /parametros/1 or /parametros/1.json
    def update
      aux = params[:parametro][:monto]

      if aux.scan(/\D/).empty? then
        respond_to do |format|
          format.html { redirect_to parametros_url, alert: "Se debe ingresar un numero" }
          format.json { head :no_content }
        end
      elsif aux.to_i > 0 then
        respond_to do |format|
          if @parametro.update(parametro_params)
            format.html { redirect_to  parametros_url, notice: "Parametros actualizadas correctamente." }
            format.json { render :index, status: :ok, location: @parametro }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @parametro.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to parametros_url, alert: "No se puede dar un valor negativo al parametro" }
          format.json { head :no_content }
        end
      end

  end

  # DELETE /parametros/1 or /parametros/1.json
  def destroy
    @parametro.destroy

    respond_to do |format|
      format.html { redirect_to parametros_url, notice: "Parametro eliminado correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parametro
      @parametro = Parametro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parametro_params
      params.require(:parametro).permit(:nombre ,:tipo ,:monto)
    end
end
