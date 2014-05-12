class CuresController < ApplicationController
	before_action :set_cure, only: [:edit, :update, :show, :destroy]
		
	def index
		@cures = Cure.all
		@people = Person.all
	end

	def new
		@cure = Cure.new
	end

	def create
		@cure = Cure.new(params.require(:cure).permit(:item, :amount, :order, :lastnight))
		if @cure.save
			redirect_to cures_path
		else
			render 'new'
		end
	end

	def show
		@cure = Cure.find(params[:id])
	end

	def edit
		@cure = Cure.find(prams[:id])
		@people = Person.all
	end

	def update
		if @cure.update_attributes(params.require(:cure).permit(:item, :amount, :order, :lastnight))
			redirect_to cures_path
		else
			render 'edit'
		end
	end

	def destroy
		@cure.destroy
		redirect_to cures_path
	end

end
