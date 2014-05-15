class PeopleController < ApplicationController
	before_action :authenticate_user, :set_person, only: [:edit, :update, :show, :destroy]
		
	def index
		@people = Person.all
	end

	def new
		@person = Person.new
	end

	def create
		@person = Person.new(params.require(:person).permit(:name, :email, :age, :password))
		if @person.save
			redirect_to people_path
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @person.update_attributes(params.require(:person).permit(:name, :email, :age))
			redirect_to people_path
		else
			render 'edit'
		end
	end

	def destroy
		@person.destroy
		redirect_to people_path
	end

	private

		def set_person
			@person = Person.find(params[:id])
		end
		
end
