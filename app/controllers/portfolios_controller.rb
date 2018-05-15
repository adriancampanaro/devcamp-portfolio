class PortfoliosController < ApplicationController
	def index
		@portfolios_items = Portfolio.all
    #@portfolios_items = Portfolio.where(subtitle: 'Ruby on Rails')
    #@portfolios_items = Portfolio.where(subtitle: 'Angular')
    #@portfolios_items = Portfolio.angular
    #@portfolios_items = Portfolio.ruby_on_rails_portfolios_items
	end

  def angular
    @angular_portfolios_items = Portfolio.angular
  end


	def new
		@portfolio_item = Portfolio.new
		### create something from scratch
	end

	# GET /portfolios/1
  	def show
    	@portfolio_item = Portfolio.find(params[:id])
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

  ## edit_portfolio GET    /portfolios/:id/edit(.:format) portfolios#edit
  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  end

  # PATCH/PUT /portfolios/1
  def update
  	@portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
       else
        format.html { render :edit }        
      end
    end
  end


   # DELETE /portfolio/1
  def destroy
  	# Perform the lookup
  	@portfolio_item = Portfolio.find(params[:id])

  	# Destroy/delete the record 
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to 	portfolios_path, notice: 'Record was destroyed.' }
     end
  end

end
