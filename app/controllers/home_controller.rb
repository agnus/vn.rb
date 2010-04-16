class HomeController < ApplicationController
  before_filter :set_locale
  def index
    @podcast = Podcast.published.find(:last)
  end

end
