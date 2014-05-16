class CuresController < ApplicationController
	before_action :set_cure, only: [:edit, :update, :show, :destroy]
		
	def index
		@cures = Cure.all
		@people = Person.all
	end

	def all
		@cures = Cure.all
	end

	def new
		@cure = Cure.new
		@person = Person.find(params[:person_id])
	end

	def create
		@cure = current_user.cures.new(params.require(:cure).permit(:item, :amount, :order, :lastnight, :image))
		if @cure.save
			redirect_to person_cures_path
		else
			render 'new'
		end
	end

	def show
	end

	def edit
		@person = Person.find(params[:person_id])
	end

	def update
		if @cure.update_attributes(params.require(:cure).permit(:item, :amount, :order, :lastnight, :image))
			redirect_to cures_path
		else
			render 'edit'
		end
	end

	def destroy
		@cure.destroy
		redirect_to cures_path
	end

def set_cure
	@cure = Cure.find(params[:id])
end

end
