class HomeController < ApplicationController
  def index
    @events = Event.all
    @vlogs = Vlog.all
  end
end
