class CommentsController < ApplicationController
    before_action :require_login

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to @post, notice: "Comment posted!"
        else
            redirect_to @post, alert: "Failed to post comment."
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
