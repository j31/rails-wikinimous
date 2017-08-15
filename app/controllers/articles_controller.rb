class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @krammed = Kramdown::Document.new(@article.content).to_html.html_safe
  end

  def new
    @article = Article.new
    @article.save
  end

  def create
    @article = Article.create(params[:id])
    @article.create(article_params)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
