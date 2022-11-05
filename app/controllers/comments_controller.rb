class CommentsController < ApplicationController
  # http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD_FOR_DEL'], only: :destroy

  def create
    @article = Article.kept.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.kept.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.discard
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end