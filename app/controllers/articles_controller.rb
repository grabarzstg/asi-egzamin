class ArticlesController < ApplicationController
  before_filter :authorize, :except => [:main]
 
  def new
    @article = Article.new
  end
  
  def main
    @articles = Article.all
  end
  
  def index
    @articles = Article.all
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
	 flash[:success] = 'Article was successfully created.'
      redirect_to @article
    else
	  flash[:danger] = 'There was a problem creating the article.'
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
	@comments = @article.comments.all
    @comment = @article.comments.build
  end
  
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
	  flash[:success] = 'Article was successfully edited.'
      redirect_to @article
    else
	  flash[:danger] = 'There was a problem editing the article.'
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
    flash[:success] = 'Article was successfully deleted.'
    redirect_to articles_path
	else
	  flash[:danger] = 'There was a problem deleting the article.'
	end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
