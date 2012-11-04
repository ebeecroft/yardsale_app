class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js

  def create
    @yardsale = Yardsale.find(params[:relationship][:followed_id])
    current_user.follow!(@yardsale)
    respond_with @yardsale
  end

  def destroy
    @yardsale = Relationship.find(params[:id]).followed
    current_user.unfollow!(@yardsale)
    respond_with @yardsale
  end
end