class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to :root
  end

  private
  def article_params
    params.require(:article).permit( :title, :text )
  end

  # ログインしていなかったらindexに飛ばす
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
