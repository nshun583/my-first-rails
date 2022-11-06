class ArticlesCategoriesController < ApplicationController
  def create
    @article = Article.kept.find(params[:article_id])

    # there are possibly several category_ids requested once, so treat them each
    for @each_category_id in params[:articles_category][:category_id]

      # achieve "INSERT IGNORE" like behavior by wiping category relationship once and re-insert
      @articles_category_current = ArticlesCategory.find_by(article_id: params[:article_id], category_id: @each_category_id)
      logger.debug(@articles_category_current.inspect)
      if @articles_category_current.nil?
         # do nothing here
      else
        @articles_category_current.destroy
      end

      @articles_category = ArticlesCategory.new({article_id: params[:article_id], category_id: @each_category_id})
      if @articles_category.save
        logger.debug("category relation saved")
        logger.debug(@articles_category.inspect)
      else
        logger.debug("category relation save failed")
      end
    end
    redirect_to article_path(@article)
  end

  private
    def articles_category_params
      params.require(:articles_category).permit(:article_id, { category_id: [] })
    end
end
