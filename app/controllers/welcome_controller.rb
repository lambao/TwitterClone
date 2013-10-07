class WelcomeController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def signUp
  end

  def signIn
  end

  def forgetPassword
  end
end
