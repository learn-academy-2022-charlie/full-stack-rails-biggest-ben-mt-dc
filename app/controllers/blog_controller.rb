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
        # Code below to be implemented during "create"
        # @blog = Blog.new(
        # title: params[:title],
        # content: params[:content]
        # )

end
