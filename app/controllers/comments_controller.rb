class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "Create Succesfully"
      redirect_to article_path(@article)
    else
      render 'show'
      flash.now[:notice] = "Create Failed"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Delete Succesfully"
      redirect_to article_path(@article)
    else
      render 'show'
      flash.now[:notice] = "Delete Failed"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end