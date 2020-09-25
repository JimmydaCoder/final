class PostsController < ApplicationController
    before_action :authenticate_user!


   def index
        @posts = Post.all
    end

  
    
    def new
      @post = Post.new
    end

    def create
      
      @post = current_user.posts.new(post_params)
      
      
    if @post.save
      flash[:success] = "Post created"
      redirect_to action: "index"
    else
      render 'new'
    end
    end

    def show
      @post = Post.find(params[:id])

    end


    def destroy
      

      @post = Post.find(params[:id])
      @post.destroy
      redirect_to action: "index"
      flash.notice = "Post Deleted!"
    end


    def post_params
      params.require(:post).permit(:body)
    end

end
