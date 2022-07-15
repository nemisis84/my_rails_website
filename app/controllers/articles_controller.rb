class ArticlesController < ApplicationController
    

    def index
      @articles = Article.all
    end


    def show
        @article = Article.find(params[:id])
    end

    def new
        if helpers.logged_in?
            @article = Article.new
        else
            redirect_to login_path
        end
    end


    def create
        
        @article = Article.create(article_params)
        @article.creator = helpers.current_user.id
        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        if helpers.logged_in?
            @article = Article.find(params[:id])
        else
            redirect_to login_path
        end
    end
    
    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        if helpers.logged_in?
            
            @article = Article.find(params[:id])
            @article.destroy
        
            redirect_to root_path, status: :see_other
        else
            redirect_to login_path
        end
    end



    private
        def article_params
            params.require(:article).permit(:title, :body, :status, :creator)
        end

  end
  