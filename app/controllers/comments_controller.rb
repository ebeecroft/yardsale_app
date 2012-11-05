class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user

  def create
    # @yardsale = Yardsale.find(params[:yardsale_id])
    @comment = @yardsale.comments.build(params[:comment])
    if @comment.save
      redirect_to @yardsale, :notice => 'Comment was successfully created.'
    else
      redirect_to @yardsale
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # @yardsale = Yardsale.find(params[:yardsale_id])
    @comment.destroy

    redirect_to @yardsale, :notice => 'Comment was successfully deleted.'
  end

  private

    def correct_user
        @yardsale = current_user.yardsales.find_by_id(params[:yardsale_id])
        redirect_to root_url if @yardsale.nil?
    end
end
