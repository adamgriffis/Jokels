class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :daily_word
  helper_method :generate_title
  helper_method :user_name

  DEFAULT_TITLE = "Jokels - Share your jokes!"

  private

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def daily_word
    @daily_word = DailyWord.last[:word] if DailyWord.last
  end
  
  def generate_title text = nil
    if text
      @title = "Jokels - #{text} - Share your jokes!"
    else
      @title = DEFAULT_TITLE
    end
  end
  
  # puts an @ in front of Twitter names  
  def user_name user
    if user.provider == "twitter"
      return "@"+user.name
    else
      return user.name
    end
  end
  
end
