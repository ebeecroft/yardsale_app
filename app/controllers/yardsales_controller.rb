class YardsalesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @yardsale = current_user.yardsales.build(params[:yardsale])
    if @yardsale.save
      flash[:success] = "Yardsale created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @yardsale.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @yardsale = current_user.yardsales.find_by_id(params[:id])
      redirect_to root_url if @yardsale.nil?
    end
end
###################################################
# class YardsalesController < ApplicationController
#   def index
#     @yardsales = Yardsale.all
#   end

#   def show
#     @yardsale = Yardsale.find(params[:id])
#   end

#   def new
#     @yardsale = Yardsale.new
#   end

#   def create
#     @yardsale = Yardsale.new(params[:yardsale])

#     if @yardsale.save
#       redirect_to yardsales_path, :notice => "Your yardsale was created successfully"
#     else
#       render "new"
#     end
#   end

#   def edit
#     @yardsale = Yardsale.find(params[:id])
#   end

#   def update
#     @yardsale = Yardsale.find(params[:id])

#     if @yardsale.update_attributes(params[:yardsale])
#       redirect_to yardsales_path, :notice => "Your yardsale has been updated"
#     else
#       render "edit"
#     end
#   end

#   def destroy
#     @yardsale = Yardsale.find(params[:id])

#     @yardsale.destroy
#     redirect_to yardsales_path, :notice => "Your yardsale has been deleted"
#   end
# end