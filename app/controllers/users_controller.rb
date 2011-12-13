class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @jokes = Joke.find_all_by_user_id params[:id]
    
    generate_title "#{user_name @user}'s jokes"
    
    respond_to do |format|
      format.html
    end
  end
  
end
