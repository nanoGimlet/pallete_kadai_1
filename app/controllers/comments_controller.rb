class CommentsController < ApplicationController

  def new
    @comment = article.comments.new
  end

  def create
    @comment = article.comments.new(comment_params)
    if @comment.save
      flash[:success] = :"コメントを投稿しました"
      redirect_to article_path(article)
    else
      render 'new'
      flash.now[:error] = :"コメントを投稿できませんでした"
    end
  end

  def edit
  end

  def update
    if comment.update(comment_params)
      flash[:success] = :"コメントを更新しました"
      redirect_to article_path(article)
    else
      render 'edit'
      flash.now[:error] = :"コメントを更新できませんでした"
    end
  end


  def destroy
    if comment.destroy
      flash[:success] = :"コメントを削除しました"
      redirect_to article_path(article)
    else
      render 'new'
      flash.now[:error] = :"コメントを削除できませんでした"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:username, :body)
    end

    def article
      @article ||= Article.find(params[:article_id])
    end
    helper_method :article

    def comment
      @comment ||= Comment.find(params[:id])
    end
    helper_method :comment
end
