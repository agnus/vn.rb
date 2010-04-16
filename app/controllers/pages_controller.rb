class PagesController < ApplicationController
  before_filter :set_locale 
  def sponsors
    return "sponsors"
  end
  
end
