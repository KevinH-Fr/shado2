class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy upvote downvote vote]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def vote 

    case params[:type]
    when 'upvote'
      if current_user
        @post.upvote!(current_user)
      else
        return redirect_to new_user_registration_path, alert: "Sign up first"
      end 
    when 'downvote'
      @post.downvote!(current_user)
    else 
      return redirect_to request.url, alert: "no such vote type"
    end

    respond_to do |format| 
      format.html do 
        redirect_to @post
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@post, 
          partial: "posts/post",
          locals: {post: @post })
      end
    end

  end 

  def upvote
    @post.upvote!(current_user)
    
  end

  def downvote
    @post.downvote!(current_user)
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:athlete_id, :media, :title, :location, :content, :exclusif)
    end
end
