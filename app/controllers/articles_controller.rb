class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @allarticles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    #render plain: params[:article].inspect ##nếu chỉ muốn display những gì submit
    @article = Article.new(article_params) #we need to WHITELIST the values of article
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new' #render nhung gi da tao
    end
    #@article.save
    #redirect_to articles_path(@article) #dòng này nhập sau khi đã viết dòng tạo permit cho params (trong file này luôn, dòng 16)

  end

  def update

    if @article = Article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy

    @article.destroy
    flash[:notice] = "Article is successfully deleted"
    redirect_to articles_path
  end
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
