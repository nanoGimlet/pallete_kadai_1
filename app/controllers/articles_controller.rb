class ArticlesController < ApplicationController
    # 記事の一覧表示
    def index
        @articles = Article.all
    end

    # 記事の表示
    def show
    end

    # 記事の作成
    def new
        @article = Article.new
    end

    # 記事の登録
    def create
        # articleモデルの属性の初期化
        @article = Article.new(article_params)

        # DBに登録できた場合
        if @article.save
            flash[:success] = :"記事を投稿しました"
            redirect_to @article
        #DBに登録できなかった場合
        else
            render 'new'
            flash.now[:error] = :"記事を投稿できませんでした"
        end
    end

    # 記事の編集
    def edit
    end
    
    # 記事の更新
    def update
        # DBに登録できた場合
        if article.update(article_params)
            flash[:success] = :"記事を更新しました"
            redirect_to article
        # DBに登録できなかった場合
        else
            render 'edit'
            flash.now[:error] = :"記事を更新できませんでした" 
        end
    end

    # 記事の削除
    def destroy
        if article.destroy
            flash[:success] = :"記事を削除しました"
            redirect_to articles_path
        else
            render 'index'
            flash.now[:error] = :"記事を削除できませんでした"
        end
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

        def article
            @article ||= Article.find(params[:id])
        end
        helper_method :article
end
