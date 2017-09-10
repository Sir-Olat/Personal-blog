module Blog
  class PostsController < BlogController


    def index
      # @posts = Post.paginate(:page => params[:page])
      @posts = storage.list_for(params[:page], params[:tag])
    end


    def show
      @post = storage.friendly.find(params[:id])
    end

    def storage
      Post.published
    end

  end

end