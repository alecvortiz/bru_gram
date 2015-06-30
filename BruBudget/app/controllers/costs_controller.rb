class CostsController < ApplicationController
	 # before_action :authenticate_user!, except: [:index, :show]

	 def index
		@costs = current_user.costs
	 end

	 def show
	 	@cost = Cost.find params[:id]
	 end

	 def new 
	 	@user = current_user
	 	@cost = Cost.new
	 end

	 def create
	 	@cost = current_user.costs.create(costs_params)
	 	if @cost.save
	 		redirect_to user_cost_path(current_user, @cost), notice: "Cost successfully created."
	 	else
	 		render 'new'
	 	end
	 	
	 end

	 def edit 
	 	@cost = current_user.costs.find params[:id]
	 end

	 def update
 	    @cost = current_user.costs.find(params[:id])

  		if @cost.update(costs_params)
   	    	redirect_to user_cost_path(current_user, @cost)
   	    else 
   			render 'edit'
   		end
	 end

	 def destroy
	 	cost = current_user.costs.find params[:id]
	 	cost.destroy
	 	redirect_to "/"
	 end

	 private 
	 	def costs_params
			params.require(:cost).permit(:name, :price, :date)
	 	end
end


