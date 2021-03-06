class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # considered unsafe -> SQL injections
  # TODO !!!! sanitize this!
  def sort_products
    # defaults to "name"
    params[:sort] || "name"
  end

  # considered unsafe -> SQL injections
  # TODO !!!! sanitize this!
  def sort_direction
    params[:direction] || "asc"
  end

# http://railscasts.com/episodes/228-sortable-table-columns?view=asciicast
# http://railscasts.com/episodes/228-sortable-table-columns?autoplay=true


  before_action :show_categories
  before_action :set_cart

  def show_categories
    @categories = Category.all
  end

  private
    def set_cart
      @cart = session[:cart]
      @cart ||= {}
    end

end
