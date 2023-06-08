def index

  if @current_user
@posts = Post.where({"user_id" => @current_user["id"] })
    @post = Post.new
  
  end

end