class ProjectsController < ApplicationController
  before_filter :set_locale 
  def index
    @projects = Project.find(:all, :order => "name ASC", :include => :user)
    @users = User.find(:all, :order => "full_name ASC", :include => :projects)
  end

end