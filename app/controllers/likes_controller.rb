class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]



    def new
        @like = Like.new
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
      end
    
    def create
        if already_liked?
        flash[:notice] = "You can't like more than once"
        else
        @post.likes.create(user_id: current_user.id)
        redirect_back(fallback_location: root_path) 
        end

       # @like = current_user.post.likes.new
        #@like.post_id = params[:post_id]
       #@like.save
        #@like = current_user.likes.new(post_params)

        #redirect_to like_path(@like)
    end


    def show
    end
    
           
    def destroy
        if !(already_liked?)
            flash[:notice] = "Cannot unlike"
        else
            @like = find_like
            @like.destroy
            redirect_back(fallback_location: root_path) 

        end
    end


    def find_post
        @post = Post.find(params[:post_id])
      end

      def find_like
        @like = @post.likes.find(params[:id])
     end  

end
