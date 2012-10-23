class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @yardsale  = current_user.yardsales.build
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
