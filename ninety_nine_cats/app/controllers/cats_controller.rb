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
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def create
    cat = Cat.new(cats_params)

    redirect_to (cat.save ? cats_url : new_cat_url)
  end

  def update
    cat = Cat.find(params[:id])
    redirect_to (cat.update(cats_params) ? cat_url(cat) : edit_cat_url(cat))
  end

  def persisted?
    Cat.find_by(id: params[:id])
  end

  private
  def cats_params
    params.require(:cats).permit(:name, :sex, :color, :description, :birth_date)
  end

end
