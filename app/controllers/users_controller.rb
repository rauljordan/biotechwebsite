class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :destroy, :following, :followers, :edit, :update]
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id 
  		redirect_to root_url
  	else
  		render :action => "new"
  	end
  end

  def index
    @search = User.search(params[:q])
    if @search
      @users = @search.result
    else
      @users = User.paginate(:page => params[:page], :order => 'created_at DESC')
    end
  end

  def show
      @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # handle a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_user
      
        redirect_to root_url, notice: "Please sign in." unless session[:user_id]
      
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == session[:user_id]
    end
end

end
