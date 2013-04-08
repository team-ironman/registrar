class UsersController < ApplicationController
  # before_filter :authorize, :except => [:new]
  # before_filter :load_user_to_edit, :only => [:edit, :update]
  layout 'credentials', :only => :new

  def edit
    @user = load_user
  end

  def show
    @user = load_user
  end

	def update
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

	end

  def new
    @user = User.new
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
    def load_user
      if !params[:token].blank?
        if @user = User.find_by_token(params[:token])
          @user.password_digest=nil
          @user.token_date_accepted=DateTime.now
          session[:user_id] = @user.id
        end
      elsif params[:id] && (current_user.id == params[:id].to_i)
        puts 2
        @user = current_user
      elsif params[:id] && (current_user.id != params[:id].to_i)
        puts 3
        redirect_to root_url, notice: "Don't try to be someone you're not."        
      elsif !params[:id] && current_user
        puts 4
        @user = current_user
      else
        redirect_to root_url, notice: "Oops"
      end
      @user
    end

end
