class CommentsController < ApplicationController
    
    # http_basic_authenticate_with name: "username", password: "password", only: :destroy

    
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create([helpers.current_user.username ,comment_params])
        redirect_to article_path(@article)
    end


    def destroy
        if helpers.logged_in?
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id])
            @comment.destroy
            redirect_to article_path(@article), status: 303
        else
            redirect_to login_path
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :status)
    end
end
