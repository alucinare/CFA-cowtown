class AdminController < ApplicationController
  before_action :authorise_user, only: :index

  def index
    @all_users = User.all
    @all_posts = Post.all
  end


private

  def authorise_user
    if current_user.user_type != 'admin' #this is limited because it cannot be used on other pages and because there may be different users and it wolud be a really long if statement.
      redirect_to posts_path, notice: 'Access DENIED'
    end
  end

  # private
  #
  #   def deny_user
  #     if user_type != 'admin'
  #       redirect_to posts_path
  #     end
  #   end


end
