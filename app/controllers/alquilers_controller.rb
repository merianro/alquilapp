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
    useraux = params[:alquiler][:user_id]
    caraux = params[:alquiler][:car_id]
    puts (Alquiler.where(user_id: useraux.to_i,car_id: caraux.to_i).count)
    if Alquiler.where(user_id: useraux.to_i,car_id: caraux.to_i).count > 0 then
      ultal = Alquiler.where(user_id: useraux.to_i,car_id: caraux.to_i).last.end_date.to_i - DateTime.now.to_i
    else
      ultal = 999999
    end
    if ultal > 10800 then

      @alquiler = Alquiler.new(alquiler_params)
      @alquiler.update(monto: @alquiler.horas * Parametro.find_by(nombre: "Alquiler").monto)
      @alquiler.update(end_date: @alquiler.created_at + @alquiler.horas.hours)
      @alquiler.car.update(disponible: false)
      @alquiler.user.update(saldo: @alquiler.user.saldo - @alquiler.monto)
      @alquiler.update(activo:true)
      @alquiler.user.update(alquiler_activo: true)

      respond_to do |format|
        if @alquiler.save
          format.html { redirect_to alquiler_url(@alquiler), notice: "Alquiler correctamente creado." }
          format.json { render :show, status: :created, location: @alquiler }
        else
          format.html { render :new, alert: "Debes estar validado para alquilar."  }
          format.json { render json: @alquiler.errors,  status: :unprocessable_entity  }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "No puede alquilar este vehículo, ya lo utilizó hace menos de 3 horas" }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /alquilers/1 or /alquilers/1.json
  def update
    respond_to do |format|
      if (@alquiler.horas + params[:alquiler][:horas].to_i <= 24 )
        @alquiler.update(horas: @alquiler.horas + params[:alquiler][:horas].to_i)   
        @alquiler.update(monto: @alquiler.horas * Parametro.find_by(nombre: "Alquiler").monto )
        @alquiler.update(end_date: @alquiler.created_at + @alquiler.horas.hours)    
        format.html { redirect_to alquiler_url(@alquiler), notice: "Alquiler correctamente actualizado." }
        format.json { render :show, status: :ok, location: @alquiler }
      else
        format.html { redirect_to edit_alquiler_path(@alquiler), alert: "La cantidad total de horas de alquiler debe ser menor a 24." }
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

  def dejar_auto
    @alquiler = Alquiler.find(params[:id])
    @alquiler.car.update(disponible: true)  
    @alquiler.update(activo: false)
    @alquiler.user.update(alquiler_activo: false)
    exceso = DateTime.now.to_i - @alquiler.end_date.to_i
    if exceso > 0 then
      aux = exceso / 900
      @alquiler.user.update(saldo: @alquiler.user.saldo - Parametro.find_by(nombre: "Tiempo Excedido").monto)
      if aux >= 1
        @alquiler.user.update(saldo: @alquiler.user.saldo - (Parametro.find_by(nombre: "Tiempo Excedido").monto * aux))
        respond_to do |format|
          format.html { redirect_to root_path, alert: "Se le ha descontado $" + ((Parametro.find_by(nombre: "Tiempo Excedido").monto * aux)+Parametro.find_by(nombre: "Tiempo Excedido").monto).to_s + " de su billetera debido a que no entrego el vehículo a tiempo." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to root_path, alert: "Se le ha descontado $" + (Parametro.find_by(nombre: "Tiempo Excedido").monto).to_s + " de su billetera debido a que no entrego el vehículo a tiempo." }
          format.json { head :no_content }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Su alquiler ha finalizado." }
        format.json { head :no_content }
      end
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
