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
  
  def newsu
    @user = User.new
    @users = policy_scope(User)
    authorize @users
  end
  
  def create_su
    @user = User.new(su_params)
  
    respond_to do |format|
      if @user.save
        User.where(id: @user.id).update(role: 'su')
        format.html { redirect_to suindex, notice: "Supervisor creado correcatamente." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
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
    @user.destroy

    if current_user.admin? or current_user.su?  then
      respond_to do |format|
        format.html { redirect_to users_drindex_path, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
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
      params.require(:user).permit(:name, :surname, :birthdate, :phone, :dni)
    end

    def su_params
      params.require(:user).permit(:name, :surname, :birthdate, :phone, :dni, :email, :password)
    end
    
end
