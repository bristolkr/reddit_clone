class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  

  def index
  	@comments = Comment.all
  end

  # def new
  # 	@post = Post.find(params[:post_id])
  # 	@comment = current_user.comments.new
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    redirect_to post_path, notice: 'Comment was successfully created.'

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @post, notice: 'Comment was successfully created.' }
    #   else
    #     format.html { render action: "new" }
    #   end
    # end
  end

  def show
  end

  def edit
  	@comment.edit(params[:post_id])
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully edited.' }
    end
  end

  def destroy
    @comment.destroy(params[:post_id])
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end
end
