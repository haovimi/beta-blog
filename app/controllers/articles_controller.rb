class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect ##nếu chỉ muốn display những gì submit
    @article = Article.new(article_params) #we need to WHITELIST the values of article
    @article.save
    redirect_to articles_show(@article) #dòng này nhập sau khi đã viết dòng tạo permit cho params (trong file này luôn, dòng 16)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
