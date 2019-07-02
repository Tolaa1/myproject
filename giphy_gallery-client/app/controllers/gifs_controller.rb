class GifsController < ApplicationController
    def index
        @gifs =  Gif.all 
        render json: @gifs, include: [:comments]
    end 

    def show 
        @gif = Gif.find(params[:d])
        render json: @gif, include: [:comments]
    end

    def new
        @gif = Gif.new 
        render json: @gif, include: [:comments]
    end 

    def create 
        @gif = Gif.new(title: params[:title], description: params[:description],url: params[:url],likes: params[:likes] )
        if @gif.save
            render :show, status: :created, location: @gif 
        else 
            render json: @gif.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @gif = Gif.find(params[:id])
        @gif.delete
        render json: @gif        
    end

    def update
        @gif = Gif.find_by(id: params[:id])
        if @gif
            @gif.update(likes: @gif.likes + 1)
            render json: @gif 
        else
            render json: @gif.errors, status: 'not found'
        end
    end

end

