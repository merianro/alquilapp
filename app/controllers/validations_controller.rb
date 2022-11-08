class ValidationsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_op, except: [ :new ]
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
        format.html { redirect_to validation_url(@validation), notice: "Validation was successfully created." }
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
        format.html { redirect_to validation_url(@validation), notice: "Validation was successfully updated." }
        format.json { render :show, status: :ok, location: @validation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @validation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /validations/1 or /validations/1.json
  def destroy
    @validation.destroy

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "Validation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def asignarse
    @validation = Validation.find(params[:id])
    @validation.update(su_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "Validation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def validate
    @validation = Validation.find(params[:id])  
    @validation.user.update(validado: true)

    respond_to do |format|
      format.html { redirect_to validations_url, notice: "Validation was successfully destroyed." }
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
      params.require(:validation).permit(:su_id, :image, :user_id)
    end

    def is_op
      if current_user.su?
        return true
      else
        redirect_to root_path
      end
    end

end
