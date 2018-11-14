class BlogsController < ApplicationController
  def top
  end

  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
  end

  def create
    blog = Blog.new(blog_params)
    if
      blog.save
      redirect_to blog_path(blog.id)
      flash[:notice] = "Book was successfully created."
    else
      render("blogs_path")
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end


  def destroy
   blog = Blog.find(params[:id])
   if
     blog.destroy
     redirect_to blogs_path
     flash[:notice] = "Book was successfully destroyed."
    else
      render("blogs_path")
    end
  end

  def update
    blog = Blog.find(params[:id])
    if
      blog.update(blog_params)
      redirect_to blog_path(blog.id)
      flash[:notice] = "Book was successfully updated."
    else
      render("blogs_path")
    end
  end

 private
 def blog_params
  params.require(:blog).permit(:title, :body)
 end

end