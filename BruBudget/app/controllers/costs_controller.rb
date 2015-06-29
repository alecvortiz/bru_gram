class CostsController < ApplicationController
	 def index
		@user = current_user
		@costs = @user.costs
	 end

	 def show
	 	@user = current_user
	 	@cost = Cost.find params[:id]
	 end

	 def new 
	 	@user = current_user
	 	@cost = Cost.new
	 end

	 def create
	 	@user = current_user
	 	@cost = @user.costs.create(costs_params)
	 	if @cost.save
	 		redirect_to user_cost_path(@user, @cost)
	 	else
	 		render 'new'
	 	end
	 	
	 end

	 def edit 
	 	@user = current_user
	 	@cost = @user.costs.find params[:id]
	 end

	 def update
		@user = current_user
 	    @cost = @user.costs.find(params[:id])

  		if @cost.update(costs_params)
   	    	redirect_to @cost
   	    else 
   			render 'edit'
   		end
	 end

	 def destroy
	 	user = current_user
	 	cost = user.costs.find params[:id]
	 	cost.destroy
	 	redirect_to "/"
	 end

	 private 
	 	def costs_params
			params.require(:cost).permit(:name, :price, :date)
	 	end
end


