class PostsController < ApplicationController
    # before_action :find_post, only: [:show, :update, :edit, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

   def index
       @posts = Post.all.order("created_at DESC")
   end

   def new
       @post = Post.new
   end

   def create
       @post = Post.new(post_params)

       if @post.save
           redirect_to @post
       else
           render 'new'
       end
   end

   def show
    @post = Post.find(params[:id])
  end

   def update

       if @post.update(post_params)
           redirect_to @post
       else
           render 'edit'
       end
   end

   def edit
       @post = Post.find(params[:id])
   end

   def destroy
       @post = Post.find(params[:id])
       @post.destroy

       redirect_to posts_path

   end

   private

   def post_params
       params.require(:post).permit(:title, :content)
   end

   private

def set_post
  @post = Post.find(params[:id])
end
   # def find_post
   # 	@post = Post.find(params[:id])
   # end

end