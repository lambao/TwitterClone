class WelcomeController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = Micropost.all.paginate(page: params[:page], :per_page => 20)
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
