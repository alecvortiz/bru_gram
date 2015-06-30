class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to user_photo_path(current_user, @photo)
  end

 
     def destroy
      @photo = current_user.photos.find(params[:photo_id])
      @comment = @photo.comments.find(params[:id])
      @comment.destroy
      redirect_to user_photo_path(current_user, @photo)
    end

    def edit 
     @photo = current_user.photos.find(params[:photo_id])
     @comment = @photo.comments.find(params[:id])
     
    end

   def update
      @photo = current_user.photos.find(params[:photo_id])
      @comment = @photo.comments.find(params[:id])

      if @comment.update(comment_params)
          redirect_to user_photo_path(current_user, @photo)
        else 
        render 'comments/edit'
      end
   end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
