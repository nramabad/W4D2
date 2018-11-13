class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render ( @cat ? :show : :index )
  end

  def new
    render :new
  end



end
