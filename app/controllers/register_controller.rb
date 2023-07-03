class RegisterController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    
        if @user.password == @user.password_confirmation
          if @user.save
            redirect_to root_path, notice: 'User created!'
          else
            render :index
          end
        else
          @user.errors.add(:password_confirmation, "doesn't match Password")
          render :new
        end
      end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
