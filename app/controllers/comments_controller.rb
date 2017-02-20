class CommentsController < ApplicationController
    def create
        Comment.create(text: comment_params[:text], image: comment_params[:image], tweet_id: params[:tweet_id], user_id: current_user.id)
        redirect_to tweet_path(id: params[:tweet_id]), notice: 'コメントを投稿しました。'
    end

    def destroy
        comment = Comment.find(params[:id])
          if comment.user_id == current_user.id
             comment.destroy
             redirect_to tweet_path(id: params[:tweet_id]), notice: '削除しました。'
          end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :image)
    end
end
