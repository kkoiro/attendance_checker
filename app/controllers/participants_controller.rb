class ParticipantsController < ApplicationController
	before_action :set_participant, only: [:show, :edit, :update, :destroy, :check]
	before_action :set_participants, only: [:index ,:search, :checked, :unchecked]

	# GET /participants
	# GET /participants.json
	def index
		@classifications.each do |classification|
			@participants.push(Participant.where("classification_id = ?", classification.id))
		end
	end

	# GET /participants/1
	# GET /participants/1.json
	def show
	end

	# GET /participants/new
	def new
		@participant = Participant.new
	end

	# GET /participants/1/edit
	def edit
	end

	# POST /participants
	# POST /participants.json
	def create
		@participant = Participant.new(participant_params)

		respond_to do |format|
			if @participant.save
				format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
				format.json { render :show, status: :created, location: @participant }
			else
				format.html { render :new }
				format.json { render json: @participant.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /participants/1
	# PATCH/PUT /participants/1.json
	def update
		respond_to do |format|
			if @participant.update(participant_params)
				format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
				format.json { render :show, status: :ok, location: @participant }
			else
				format.html { render :edit }
				format.json { render json: @participant.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /participants/1
	# DELETE /participants/1.json
	def destroy
		@participant.destroy
		respond_to do |format|
			format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def check
		@participant.status = true
		if @participant.update(status: true)
			redirect_to participants_path
		else
			redirect_to participants_path, alert: "Failed to change status"
		end
	end

	def search
		@classifications.each do |classification|
			@participants.push(Participant.where("classification_id = ? AND name like ?", classification.id, "%#{params[:s_name]}%"))
		end
    render :index
	end

	def checked
		@classifications.each do |classification|
			@participants.push(Participant.where("classification_id = ? AND status = ?", classification.id, true))
		end
		render :index
	end

	def unchecked
		@classifications.each do |classification|
			@participants.push(Participant.where("classification_id = ? AND status = ?", classification.id, false))
		end
		render :index
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_participant
		@participant = Participant.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def participant_params
		params.require(:participant).permit(:name, :classification_id, :status, :s_name)
	end

	def set_participants
		@participants = Array.new
		@classifications = Classification.all
	end
end
