class CommentsController < ApplicationController
  def index
    @user = current_user
    @yardsales = @user.yardsales.paginate(page: params[:page])
    @comments  = current_user.comments.all
  end

  def create
    @comment  = current_user.comments.build(params[:comment])
    @yardsale = Yardsale.find(params['yardsale_id'])
    @comment.yardsale = @yardsale
    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to @yardsale
    else
      @feed_items = []
      render @yardsale
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @yardsale = Yardsale.find(@comment.yardsale_id)
    @comment.destroy

    redirect_to @yardsale, :notice => 'Comment was successfully deleted.'
  end
end
