class YardsalesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def index
    @yardsales = Yardsale.paginate(page: params[:page])
  end

  def show
    @yardsale = Yardsale.find(params[:id])
    # @yardsales = @yardsale.yardsales.paginate(page: params[:page])
  end

  def new
    @yardsale = Yardsale.new
  end

  def create
    @yardsale = current_user.yardsales.build(params[:yardsale])
    if @yardsale.save
      flash[:success] = "Yardsale created!"
      redirect_to root_url
    else
      @post_attributes = []
      render 'new'
    end
  end

  def edit
    @yardsale = Yardsale.find(params[:id])
  end

  def update
    @yardsale = Yardsale.find(params[:id])
    if @yardsale.update_attributes(params[:yardsale])
      flash[:success] = "Yardsale updated!"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @yardsale.destroy
    flash[:success] = "Yardsale destroyed."
    redirect_to root_url
  end

  private

    def correct_user
      @yardsale = current_user.yardsales.find_by_id(params[:id])
      redirect_to root_url if @yardsale.nil?
    end

end