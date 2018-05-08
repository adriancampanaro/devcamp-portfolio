class PortfoliosController < ApplicationController
	def index
		@portfolios_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

  	# POST /portfolios
  	def create
    	@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    	### telling form what is allowed to access
    	### these are the parameters allowed to go through the system
    	

    	### portfolios_path : if item gets saved redirect to full list of portfolio items
    	respond_to do |format|
      	if @portfolio_item.save
        	format.html { redirect_to portfolios_path , notice: 'Your portfolio item is now live' }
      	else
        	format.html { render :new }
      	end
    end
  end

end
