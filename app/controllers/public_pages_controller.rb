class PublicPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @yardsales = @user.yardsales.paginate(page: params[:page])
      @feed_items = current_user.feed.paginate(page: params[:page])
      @post_attributes = current_user.post.paginate(page: params[:page])
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
