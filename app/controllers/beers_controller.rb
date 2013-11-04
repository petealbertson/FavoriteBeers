class BeersController < ApplicationController
  def index
    if params[:brewery_sort].present?
      @beers = Beer.order(:brewery)
    elsif params[:beer_sort].present?
      @beers = Beer.order(:name)
    elsif params[:abv_sort].present?
      @beers = Beer.order('abv desc')
    elsif params[:search].present?
      @beers = Beer.where("name LIKE ? OR brewery LIKE ? OR style LIKE ?",
                          "%#{params[:search]}%",
                          "%#{params[:search]}%",
                          "%#{params[:search]}%")
    else
      @beers = Beer.all
    end
  end

  def new
  end

  def create
    @beer = Beer.new
    @beer.name = params[:name]
    @beer.style = params[:style]
    @beer.abv = params[:abv]
    @beer.brewery = params[:brewery]
    @beer.nationality = params[:nationality]
    @beer.save

    redirect_to beers_url
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.name = params[:name]
    @beer.style = params[:style]
    @beer.abv = params[:abv]
    @beer.brewery = params[:brewery]
    @beer.nationality = params[:nationality]
    @beer.save

    redirect_to beers_url
  end

  def show
    @beer = Beer.find(params[:id])
    # @beer.name = params[:title]
    # @beer.style = params[:style]
    # @beer.abv = params[:abv]
    # @beer.brewery = params[:brewery]
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    redirect_to beers_url
  end
end
