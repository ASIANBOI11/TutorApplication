class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_tutor_creation

    def create 
    @comment = @tutor_creation.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to tutor_creation_path(@tutor_creation), notice: 'Comment has been created'
    else
      redirect_to tutor_creation_path(@tutor_creation), alert: 'Comment has not been created'
    end
    end

    def destroy 
    @comment = @tutor_creation.comments.find(params[:id])
    @comment.destroy
    redirect_to tutor_creation_path(@tutor_creation)
    end

  private

  def set_tutor_creation
    @tutor_creation = TutorCreation.find(params[:tutor_creation_id])
  end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
