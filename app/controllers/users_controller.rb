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
    if !@user.token.blank?
        @user.token=""
    end  

    @user.update_attributes(params[:user])
    @user.save
    flash.notice = "Updated!"
    redirect_to prework_path
	end

  def new
    @user = User.new
  end

  # def check_token(invite_token)
  #   case
  #   when Invite.find_by_token(invite_token).nil?
  #     return {:error => "Token doesn't exist"}
  #   when Invite.find_by_token(invite_token).token_used == true
  #     return {:error => "Token already used"} 
  #   when Invite.find_by_token(invite_token).token_used == false
  #     return nil
  #   end
  # end

  # def create
  #   if message = check_token(params[:token])
  #     respond_to do |format|
  #       format.html { render action: "new", notice: "FAIL! #{message[:error]}" }
  #     end
  #   else
  #     @user = User.new(params[:user])
          
  #     respond_to do |format|
  #       if @user.save
  #         Invite.find_by_token(params[:token]).update_attributes(:token_used => true)
  #         session[:user_id] = @user.id
  #         format.html { redirect_to @user, notice: 'User was successfully created.' }
  #       else
  #         format.html { render action: "new", notice: "FAIL!" }
  #       end
  #     end
  #   end
  # end
    
      
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
      binding.pry
      if params[:token]
        if @user = User.find_by_token(params[:token])
          session[:user_id] = @user.id
        end
      elsif params[:id] && (current_user.id == params[:id].to_i)
        @user = current_user
      elsif params[:id] && (current_user.id != params[:id].to_i)
        redirect_to root_url, notice: "Don't try to be someone you're not."        
      elsif !params[:id] && current_user
        @user = current_user
      else
        redirect_to root_url, notice: "Oops"
      end
      @user
    end

end
