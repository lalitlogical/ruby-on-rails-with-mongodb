class BlogsController < ApplicationController
  def index
    # Thread.new do
    #   (1..200000).each do |i|
    #     Blog.find_or_create_by(title: "Blog Title #{i}", content: "Blog Content #{i}")
    #   end
    # end
    @query = Blog.search(params)
    @total_count = @query.count
    @blogs = @query
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: "The blog has been created!" and return
    end
    render 'new'
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(blog_params)
      redirect_to blogs_path, notice: "#{@blog.title} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path, notice: "#{@blog.title} has been deleted!" and return
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
