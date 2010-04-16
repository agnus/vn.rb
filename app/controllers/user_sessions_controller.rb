class UserSessionsController < ApplicationController
  before_filter :require_not_logged_in, :only => [:new, :create]
  before_filter :set_locale 
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      puts @user_session.inspect
      render :action => :new
    end
  end

  def destroy
    if current_user.nil?
      flash[:notice] = "You're already logged out!"
    else
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
    end
    redirect_to root_path
  end

  private
  
  def require_not_logged_in
    if current_user
      redirect_to account_path
    end
  end

end

