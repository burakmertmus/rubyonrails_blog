class CommentsController < ApplicationController
	before_action :set_post
	skip_before_action :verify_authenticity_token
	
	def create
		comment = @post.comments.create! comments_params
		CommentsMailer.submitted(comment).deliver_later
		CommentsChannel.broadcast(comment)
		
		redirect_to @post
	end
	
	def destroy
	    @post = @post.comments.find(params[:post_id])
	    @comment = @post.find(params[:id]).comments
	    @comment.destroy
	    redirect_to post_path(@post)
    end
	
	private
		def set_post
			@post = Post.find(params[:post_id])
		end


		def comments_params
			params.required(:comment).permit(:body)
		end
end
