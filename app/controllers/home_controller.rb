class HomeController < ApplicationController
  def index
  	@bai_posts= BaiPost.all
  end
end
