class UsersController < ApplicationController
  # before_filter :authorize, :except => [:new]
  # before_filter :load_user_to_edit, :only => [:edit, :update]
  skip_before_filter :authorize, :only => [:complete_signup, :update, :new, :create]
  layout 'credentials', :only => :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to prework_path, notice: "You are now signed up!"
    else
      render action: "new"
    end
  end

  def edit
    @user = load_user
  end

  #  if !token.blank? then do a normal update. Otherwise, run complete_signup_update
	def update
    if params[:token].blank?
  		@user = load_user
      @user.update_attributes(params[:user])
      if @user.save
        @user.update_progress
        flash.notice = "Updated!"
        redirect_to prework_path
      else
        render action: "edit" 
        flash.notice = "Problem!"
      end
    else
      complete_signup_update
    end
	end


  def show
    @user = load_user
  end


  def complete_signup_update
    @user = User.find_by_token(params[:token])

    @user.password_digest=nil
    @user.update_attributes(params[:user])
    
    @user.token_date_accepted = Time.now if @user.valid?

    # If user gets saved correctly, send email, update progress and log them in.
    if @user.save
      @user.send_get_started_email unless @user.token == nil
      @user.update_progress
      session[:user_id] = @user.id
      flash.notice = "Updated!"
      redirect_to prework_path
    else
      render action: "edit" 
      flash.notice = "Problem!"
    end
  end


  def complete_signup
    @user = User.find_by_token(params[:token])
    if @user.is_a?(String)
      redirect_to new_session_path, :notice => @user
    else
      render 'edit'
    end
  end


  def update_codeschool
    User.find(params[:id]).codeschool_progress
    redirect_to user_prework_path(@user), :alert => "Codeschool progress updated"
  end

  def update_treehouse
    User.find(params[:id]).treehouse_progress
    redirect_to user_prework_path(@user), :alert => "Treehouse progress updated"
  end

  def static_progress
    @usercourse = UserCourse.find(params[:id])
    @usercourse.progress = params[:progress]
    @usercourse.save
    format.js #{ render json: @user, status: :created, location: @user }    
  end

  private
  
  # Returns user, allow if user_id is current user or admin logged in
  def load_user
    user_id = params[:id].blank? ? authorized_user.id : params[:id].to_i
    if user_id == authorized_user.id || current_admin_user
      user = User.find(user_id)
    else
      redirect_to root_path, notice: "Don't try to be someone you're not." 
    end
    user
  end

end
