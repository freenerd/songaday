class HomeController < ApplicationController
  def index
    if current_user
      unless current_user.has_songs?
        redirect_to "/songs/new?order_number=1", :flash => { :notice => "Create your first track" }
      else
        redirect_to "/songs"
      end
    end
  end
end
