class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:group_id])
  end

  def update
    @post = Post.find(parms[:group_id])
    @post.update(post_params)
    redirect_to groups_path, notice: "Update Success"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
