class PhotosController < ApplicationController
	def index
		@photos = current_user.photos
	 end

	 def show
	 	@photo = Photo.find params[:id]
	 end

	 def new 
	 	@user = current_user
	 	@photo = Photo.new
	 end

	 def create
	 	@photo = current_user.photos.create(costs_params)
	 	if @photo.save
	 		redirect_to user_photo_path(current_user, @photo), notice: "photo successfully created."
	 	else
	 		render 'new'
	 	end
	 	
	 end

	 def edit 
	 	@photo = current_user.photos.find params[:id]
	 end

	 def update
 	    @photo = current_user.photos.find(params[:id])

  		if @photo.update(costs_params)
   	    	redirect_to user_photo_path(current_user, @photo)
   	    else 
   			render 'edit'
   		end
	 end

	 def destroy
	 	photo = current_user.photos.find params[:id]
	 	photo.destroy
	 	redirect_to "/"
	 end

	 private 
	 	def costs_params
			params.require(:photo).permit(:image, :caption, :public)
	 	end
end


