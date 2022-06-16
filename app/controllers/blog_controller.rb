class BlogController < ApplicationController
 
    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def new
       @blog = Blog.new
    end

    def create
        @blog = Blog.create(
            # blog_params
            title: params[:title],
            content: params[:content]
        )

        if @blog.valid?
            redirect_to home_path
        else
            redirect_to new_blog_path
        end

    end
    def destroy
@blog = Blog.find(params[:id])
@blog.destroy
redirect_to home_path
    end
    # Not currently working
    # private
    # def blog_params
    #     params.require(:blog).permit(:title, :content)
    # end

    
end

