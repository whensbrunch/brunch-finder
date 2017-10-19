class UsersController < ApplicationController
  # TODO: remove. Here to learn about sessions
  def greet
    session[:name] = params[:name] if params[:name]

    render plain: "Hello, #{session[:name]}!"
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) # not final
    if @user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome to Brunch Finder!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
