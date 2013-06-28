class UsersController < ApplicationController
  before_action :signed_in_user,     only: [:index, :edit, :update, :destroy]
  before_action :correct_user,       only: [:edit, :update]
  before_action :admin_user,         only: :destroy
  before_action :action_not_allowed, only: :new
  rescue_from ActiveRecord::RecordNotFound, with: :action_not_allowed

  def index
    @users = User.paginate(page: params[:page])
  end
  
	def show
		@user = User.find(params[:id])
	end

  def new
  	# signed_in? ? admin_user : @user = User.new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_back_or @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  																 :password_confirmation)
  	end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in first." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def action_not_allowed
      logger.error "Attempt to access #{params[:action]} action while signed in."
      redirect_to user_path(current_user), notice: 'That action is not allowed.' if signed_in?
    end
end
