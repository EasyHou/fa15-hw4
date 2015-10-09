class DogsController < ApplicationController
	
	def index
		@dogs = Dog.all
	end
	
	def new
		@dog = Dog.new
	end

	def create
		@dog = Dog.new dog_params
		if @dog.save #If saving the user was successful
      		redirect_to @dog #Go to the show view of the user
    	else
      		render "new" #Go to the new view for the user
    	end
	end

	

	def show
		@dog = Dog.find params[:id]
	end

	private
	def dog_params
		params.require(:dog).permit(:name, :age)
	end

end
