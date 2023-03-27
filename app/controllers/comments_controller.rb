class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :comment))
		redirect_to post_path(@post)
	end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
      end
      

      def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
      end
      
      
 
	def destroy
        @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
        @comment.destroy
		redirect_to post_path(@post)
	end

    
  
end