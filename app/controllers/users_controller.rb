class UsersController < ApplicationController

  layout 'credentials', :only => :new

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

	def update
		@user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    flash.notice = "Updated!"

    redirect_to user_prework_path(@user)
	end

	def show
		@user = User.find(params[:id])
	end

  def new
    @user = User.new
  end

  def check_token(invite_token)
    case
    when Invite.find_by_token(invite_token).nil?
      return {:error => "Token doesn't exist"}
    when Invite.find_by_token(invite_token).token_used == true
      return {:error => "Token already used"} 
    when Invite.find_by_token(invite_token).token_used == false
      return nil
    end
  end

  def create
    if message = check_token(params[:token])
      respond_to do |format|
        format.html { render action: "new", notice: "FAIL! #{message[:error]}" }
      end
    else
      @user = User.new(params[:user])
          
      respond_to do |format|
        if @user.save
          Invite.find_by_token(params[:token]).update_attributes(:token_used => true)
          session[:user_id] = @user.id
          format.html { redirect_to @user, notice: 'User was successfully created.' }
        else
          format.html { render action: "new", notice: "FAIL!" }
        end
      end
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

end
