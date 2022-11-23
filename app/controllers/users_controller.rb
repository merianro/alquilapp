class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_policy_scoped, only: :index
  # before_action :set_user, only: %i[ show edit update destroy ]


  # GET /users or /users.json
  def index
    @user = User.all
    @users = policy_scope(User)
    authorize @users
  end

  def suindex
    @user = User.where(role: 'su')
    @users = policy_scope(User)
    authorize @users
  end

  def drindex
    @user = User.where(role: 'driver')
    #@users = policy_scope(User)
    #authorize @users
  end


  
  
  def cmngsoon
  end
  
  def show
    if current_user.id == params[:id].to_i or current_user.admin? or current_user.su? then    
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end  
  end


  # GET /users/new
  def new
    @user = User.new
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def edit_su
    @user = User.find(params[:id])
  end
  
  def newsu
    if current_user.admin? 
      @user = User.new
    end
  end
  
  def create_su

    @user = User.new(su_params)


    if User.where(dni: @user.dni, role: 'su').count > 0
      respond_to do |format|
        format.html { render :newsu, alert: "Ya existe un supervisor con ese DNI."}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    else
    respond_to do |format|
      if @user.save
        User.where(id: @user.id).update(role: 'su')
        format.html { redirect_to users_suindex_path, notice: "Supervisor creado correctamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :newsu,  status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Usuario creado correctamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update_details
    @user = User.find(params[:user][:id])
    params[:user].delete :id
    if !@user.su?
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "Datos actualizados correctamente." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update(su_params)
          format.html { redirect_to user_url(@user), notice: "Datos actualizados correctamente." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if !@user.su?
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "Usuario editado correctamente." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @user.update(su_params)
          format.html { redirect_to user_url(@user), notice: "Supervisor editado correctamente." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def actualizar_contrasena
    @user = User.find(params[:user][:id])
    puts params[:password]
    puts params[:password_confirmation]


      respond_to do |format|
        if @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
          format.html { redirect_to user_url(@user), notice: "Contraseña editada correcatamente. Por favor, inicie sesion." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    
    if current_user.admin? or current_user.su? 
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_drindex_path, notice: "Usuario correctamente eliminado." }
        format.json { head :no_content }
      end
    elsif (@user.saldo >= 0) 
          @user.destroy
          respond_to do |format|
            format.html { redirect_to new_user_session_path, notice: "Usuario correctamente eliminado." }
            format.json { head :no_content }
          end
    else
        respond_to do |format|     
        format.html { redirect_to user_url(@user), alert: "No se puede eliminar tu cuenta debido a que posees saldo negativo." }
        format.json { head :no_content }
        end
    end
  end

  def update_location
    @user = User.find(params[:user][:id])

    if params[:user][:location_point] == ""
      respond_to do |format|     
      format.html { redirect_to request.referrer, alert: "Por favor permiti el acceso a la ubicacion."}
      format.json { head :no_content }
      
      end
    else
      @user.update(location_point: params[:user][:location_point])
      respond_to do |format|     
       format.html { redirect_to request.referrer, notice: "Gracias."}
       format.json { head :no_content }
      end
    end
  end

  def anadir_saldo(id,saldo)
    @user = User.find(id)
    aux = @user.saldo + saldo.to_f
    @user.update(saldo: aux)  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :surname, :birthdate, :phone, :vencimiento_licencia, :dni, :location_point)
    end

    def su_params
      params.require(:user).permit(:name, :surname, :birthdate, :phone, :dni, :email, :vencimiento_licencia, :password, :password_confirmation)
    end
    
end
