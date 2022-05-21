class TutorCreationsController < ApplicationController

  require "rubygems"
  require "braintree"

  before_action :set_tutor_creation, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token



  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = 'k9tt22jrdqn8h9qh'
  Braintree::Configuration.public_key = 'bfygpp9r66xqstcc'
  Braintree::Configuration.private_key = 'e5196a23d76fdd0ada31b7af0af771b0'
  # GET /tutor_creations or /tutor_creations.json
  def index
    @tutor_creations = TutorCreation.all
  end

  # GET /tutor_creations/1 or /tutor_creations/1.json
  def show
    @tutor_creation = TutorCreation.find(params[:id])
    @token = Braintree::ClientToken.generate
  end

  # GET /tutor_creations/new
  def new
    @tutor_creation = TutorCreation.new
  end

  # GET /tutor_creations/1/edit
  def edit
  end

  # POST /tutor_creations or /tutor_creations.json
  def create
    @tutor_creation = TutorCreation.new(tutor_creation_params)
    @tutor_creation.user_id = current_user.id
    
    
    respond_to do |format|
      if @tutor_creation.save
        format.html { redirect_to tutor_creation_url(@tutor_creation), notice: "Tutor creation was successfully created." }
        format.json { render :show, status: :created, location: @tutor_creation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor_creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_creations/1 or /tutor_creations/1.json
  def update
    respond_to do |format|
      if @tutor_creation.update(tutor_creation_params)
        format.html { redirect_to tutor_creation_url(@tutor_creation), notice: "Tutor creation was successfully updated." }
        format.json { render :show, status: :ok, location: @tutor_creation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor_creation.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /tutor_creations/1 or /tutor_creations/1.json
  def destroy
    @tutor_creation.destroy

    respond_to do |format|
      format.html { redirect_to tutor_creations_url, notice: "Tutor creation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_creation
      @tutor_creation = TutorCreation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_creation_params
      params.require(:tutor_creation).permit(:user_id, :first_name, :last_name, :description, :price, :subject, :photo)
    end
end
