class PostsController < ApplicationController
  def new
    if @current_user
      @post = Post.new
      @post.place_id = params["place_id"]
    end
  end
  def index
    if @current_user
      @posts = Post.where({"user_id" => @current_user["id"] })
      @post = Post.new
    end
  end  
  def create
    @post = Post.new
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = @current_user["id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end
  def destroy
    @post = Post.find_by({ "id" => params["id"] })
    if @post["user_id"] == @current_user["id"]
      @post.destroy
    end
    redirect_to "/posts"
  end
end














