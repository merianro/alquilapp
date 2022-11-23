class AlquilersController < ApplicationController
  before_action :set_alquiler, only: %i[ show edit update destroy ]

  # GET /alquilers or /alquilers.json
  def index
    @alquilers = Alquiler.all
  end

  # GET /alquilers/1 or /alquilers/1.json
  def show
  end

  # GET /alquilers/new
  def new
    @alquiler = Alquiler.new
  end

  # GET /alquilers/1/edit
  def edit
  end

  # POST /alquilers or /alquilers.json
  def create
    @alquiler = Alquiler.new(alquiler_params)
    @alquiler.update(monto: @alquiler.horas * Parametro.last.tarifa)
    @alquiler.update(end_date: DateTime.now.gmtime - 3.hours + @alquiler.horas.hours)
    @alquiler.car.update(disponible: false)
    @alquiler.user.update(saldo: @alquiler.user.saldo - @alquiler.monto)

    respond_to do |format|
      if @alquiler.save
        format.html { redirect_to alquiler_url(@alquiler), notice: "Alquiler correctamente creado." }
        format.json { render :show, status: :created, location: @alquiler }
      else
        format.html { render :new, alert: "Debes estar validado para alquilar."  }
        format.json { render json: @alquiler.errors,  status: :unprocessable_entity  }
      end
    end
  end

  # PATCH/PUT /alquilers/1 or /alquilers/1.json
  def update
    respond_to do |format|
      if @alquiler.update(horas: params[:alquiler][:horas].to_i)    
        @alquiler.update(monto: @alquiler.horas * Parametro.last.tarifa )
        @alquiler.update(end_date: @alquiler.created_at - 3.hours + params[:alquiler][:horas].to_i.hours)          
        format.html { redirect_to alquiler_url(@alquiler), notice: "Alquiler correctamente actualizado." }
        format.json { render :show, status: :ok, location: @alquiler }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alquiler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alquilers/1 or /alquilers/1.json
  def destroy
    @alquiler.destroy

    respond_to do |format|
      format.html { redirect_to alquilers_url, notice: "Alquiler correctamente destruido." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alquiler
      @alquiler = Alquiler.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alquiler_params
      params.require(:alquiler).permit(:horas, :user_id, :car_id, :cantidad_ocupantes)
    end
end
