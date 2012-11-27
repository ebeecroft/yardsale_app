class SearchController < ApplicationController
  def index
    @yardsales = Yardsale.search(params[:search]).paginate(page: params[:page])
  end
end