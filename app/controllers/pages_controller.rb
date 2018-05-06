class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	###  @posts is just a variable
  end

  def about
  end

  def contact
  end
end
