class ValidationsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_op, except: [ :new, :create, :edit, :update ]
  before_action :set_validation, only: %i[ show edit update destroy ]

  # GET /validations or /validations.json
  def index 
    @validations = Validation.all
  end

  # GET /validations/1 or /validations/1.json
  def show
  end

  # GET /validations/new
  def new
    @validation = Validation.new
  end

  # GET /validations/1/edit
  def edit
  end

  # POST /validations or /validations.json
  def create
    @validation = Validation.new(validation_params)

    respond_to do |format|
      if @validation.save
        format.html { redirect_to validation_url(@validation), notice: "Validacion correctamente creada." }
        format.json { render :show, status: :created, location: @validation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /validations/1 or /validations/1.json
  def update
    respond_to do |format|
      if @validation.update(validation_params)
        if !@validation.user.validado and @validation.borrado then 
          @validation.user.update(validado: false)
          @validation.update(borrado: false)
          @validation.update(su_id: "")
          format.html { redirect_to validation_url(@validation), notice: "Validacion correctamente actualizada." }
          format.json { render :show, status: :ok, location: @validation }
        else
          @validation.update(borrado: true);
          @validation.user.update(validado: false)
          format.html { redirect_to validation_url(@validation), notice: "Validacion correctamente rechazada." }
          format.json { render :show, status: :ok, location: @validation }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validations/1 or /validations/1.json
  def destroy
    @validation.destroy
    @validation.user.update(validado: false)
    respond_to do |format|
      format.html { redirect_to validations_url, notice: "Validacion correctamente eliminada." }
      format.json { head :no_content }
    end
  end

  def asignarse
    @validation = Validation.find(params[:id])
    @validation.update(su_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "" }
      format.json { head :no_content }
    end
  end

  def desasignar
    @validation = Validation.find(params[:id])
    @validation.update(su_id: "")

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "" }
      format.json { head :no_content }
    end
  end

  def validate
    @validation = Validation.find(params[:id])  
    @validation.user.update(validado: true)
    @validation.description = nil

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_validation
      @validation = Validation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def validation_params
      params.require(:validation).permit(:user_id, :licencia, :dni, :description, :borrado)
    end

    def is_op
      if current_user.su?
        return true
      else
        redirect_to root_path
      end
    end

end
