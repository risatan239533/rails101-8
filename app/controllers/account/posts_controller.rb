class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.postsend
  end
end
