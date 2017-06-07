class PortfolioItemsController < ApplicationController
  http_basic_authenticate_with name: ENV['SITE_ADMIN_USER'], password: ENV['SITE_ADMIN_PASSWORD'], except: :index

  def new
  #literally just show a form for inputting each trait. All in the view.
    @portfolio_item = PortfolioItem.new
  end

  def create
  #this actually saves the post created in new, into the database
    @portfolio_item = PortfolioItem.new(useful_params)
    if @portfolio_item .save
    	redirect_to portfolio_items_url
    else
    	render 'new'
    end
  end

  def index
  	@portfolio_items = PortfolioItem.all
  end

  def edit
  #same as new except the forms start off filled in by finding the chosen post
    @portfolio_item = PortfolioItem.find(params[:id])
  end

  def update
  	#same as create, except for editing
  	@portfolio_item = PortfolioItem.find(params[:id])
  	if @portfolio_item.update_attributes(useful_params)
  		redirect_to portfolio_items_url
  	else
  		render 'edit'
  	end
  end

  def destroy
  #delete the current entry, redirect to the index
  PortfolioItem.find(params[:id]).destroy
  redirect_to portfolio_items_url

  end

 private

  def useful_params
  	params.require(:portfolio_item).permit(:name, :url, :description, :tag)
  end

end
