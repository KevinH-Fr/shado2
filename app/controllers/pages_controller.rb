class PagesController < ApplicationController


  def index
    @posts = Post.all.sort_by(&:updated_at).reverse!
      
    page = (params[:page].to_i > 0) ? params[:page].to_i : 1
    items = 5
    start = (page - 1) * items
    
    @pagy = Pagy.new(count: @posts.size, page: page, items: items)
    @posts = @posts.slice(start, items)
    
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def discover
    @athletes = Athlete.all.sort_by(&:updated_at).reverse!
      
    page = (params[:page].to_i > 0) ? params[:page].to_i : 1
    items = 2
    start = (page - 1) * items
    
    @pagy = Pagy.new(count: @athletes.size, page: page, items: items)
    @athletes = @athletes.slice(start, items)
    
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
