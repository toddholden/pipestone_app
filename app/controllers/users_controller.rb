class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
        if params[:create_and_sign_in]
          sign_in @user
        end
      flash[:success] = "User successfully created."
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      unless current_user.admin?
        sign_in @user
      end
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

#  Following code is in the application controller.
#  To be deleted on refactoring.
#    def signed_in_user
#      unless signed_in?
#        store_location
#        redirect_to signin_url, notice: "Please sign in."
#      end
#    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) or current_user.admin? 
    end
    
    def admin_user
      unless current_user.admin?
        redirect_to root_path
        flash[:failure] = "You can't complete that action." 
      end
    end

end
