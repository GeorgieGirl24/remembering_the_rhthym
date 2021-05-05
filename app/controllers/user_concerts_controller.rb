class UserConcertsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create
    user_concert = UserConcert.create(user_concert_params)
  end
  def destroy
  end

  private
  def user_concert_params
    params.permit(:user_id, :concert_id)
  end
end
