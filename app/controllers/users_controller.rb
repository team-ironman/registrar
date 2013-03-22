class UsersController < ApplicationController

  layout 'credentials', :only => :new

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    @user.create_associations
    @user.codeschool_progress
    @user.all_treehouse_badges
    @user.treehouse_progress
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_codeschool
    @user = User.find(params[:id])
    @user.codeschool_progress
    # redirect_to (@user, :message => 'updated codeschool')
    redirect_to user_prework_path(@user), :alert => "Codeschool progress updated"
  end

  def update_treehouse
    @user = User.find(params[:id])
    @user.all_treehouse_badges
    @user.treehouse_progress
    # redirect_to (@user, :message => 'updated codeschool')
    redirect_to user_prework_path(@user), :alert => "Treehouse progress updated"
  end

end
