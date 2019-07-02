class CommentsController < ApplicationController
    def index 
        @comments = Comment.all 
        render json:  @comments
    end 

    def show 
    end

    def create
        @comment = Comment.new(user_id: params[:user_id], gif_id: params[:gif_id],content: params[:content])
        if @comment.save 
            render json: @comment
        else 
        render json: {error: "failed to create!"}, status: 400
      end 
    end


    def destroy
        @comment= Comment.find_by(params[:id])
        @comment.delete.content
        render json: @comment        
    end
    
    def update
        if @comment.update(comment_params)
            render :show, status: :ok, location: @comment 
             else
                render json: @comment.errors, status: :unprocessable_entity
             end
        end

end
