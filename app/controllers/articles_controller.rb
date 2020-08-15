class ArticlesController < ApplicationController
    # 記事の一覧表示
    def index
        @articles = Article.all
    end

    # 記事の表示
    def show
        @article = Article.find(params[:id])
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
            flash[:notice] = "Create Succesfully"
            redirect_to @article
        #DBに登録できなかった場合
        else
            render 'new'
            flash.now[:notice] = "Create Failed"
        end
    end

    # 記事の編集
    def edit
        @article = Article.find(params[:id])
    end
    
    # 記事の更新
    def update
        @article = Article.find(params[:id])
        # DBに登録できた場合
        if @article.update(article_params)
            flash[:notice] = "Update Succesfully"
            redirect_to @article
        # DBに登録できなかった場合
        else
            render 'edit'
            flash.now[:notice] = "Update Failed" 
        end
    end

    # 記事の削除
    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:notice] = "Delete Succesfully"
            redirect_to articles_path
        else
            render 'index'
            flash.now[:notice] = "Delete Failed"
        end
    end
    
    # コントローラパラメータの定義
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
    
end
