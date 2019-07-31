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
    article.destroy if article.user_id == current_user.id # 自分の記事でない場合、削除しない
    redirect_to :root
  end

  def edit
    @article = Article.find(params[:id])
    redirect_to :root unless @article.user_id == current_user.id # 自分の記事でない場合、ルートパスにリダイレクト
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params) if article.user_id == current_user.id # 自分の記事でない場合、更新しない
    redirect_to :root
  end

  private
  def article_params
    params.require(:article).permit( :title, :text ).merge(user_id: current_user.id)
  end

  # ログインしていなかったらindexに飛ばす
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
