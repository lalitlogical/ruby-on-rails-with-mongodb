class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /Comments
  # GET /Comments.json
  def index
    @comments = @post.comments
  end

  # GET /Comments/1
  # GET /Comments/1.json
  def show
  end

  # GET /Comments/new
  def new
    @comment = Comment.new
  end

  # GET /Comments/1/edit
  def edit
  end

  # Comment /Comments
  # Comment /Comments.json
  def create
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Comments/1
  # PATCH/PUT /Comments/1.json
  def update
    respond_to do |format|
      if @comment.update_attributes!(comment_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Comments/1
  # DELETE /Comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:first_name, :last_name, :email, :body)
    end
end
