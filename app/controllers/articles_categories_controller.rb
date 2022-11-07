class ArticlesCategoriesController < ApplicationController
  def create
    @article = Article.kept.find(params[:article_id])

    # there are possibly several category_ids requested once, so treat them each
    for @each_category_id in params[:articles_category][:category_id]
      logger.debug(@each_category_id)
      # achieve "INSERT" or "UPDATE" like behavior by upsert to avoid "ActiveRecord::RecordNotUnique"
      ArticlesCategory.upsert({article_id: params[:article_id], category_id: @each_category_id},on_duplicate: :update)
    end
    redirect_to article_path(@article)
  end

  private
    def articles_category_params
      params.require(:articles_category).permit(:article_id, { category_id: [] })
    end
end
