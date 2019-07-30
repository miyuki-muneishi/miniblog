class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to :root
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to :root
  end

  private
  def article_params
    # binding.pry
    params.require(:article).permit( :title, :text )
  end
end
