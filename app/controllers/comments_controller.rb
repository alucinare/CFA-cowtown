class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # This is creating a new comment object with the parameters sent by the form
    @comment = Comment.new(comment_params)
    # This is taking the current user id and assigning it to the comment.user_id because it belongs to the user and the user can have many comments.
    @comment.user_id = current_user.id
    # This is taking the parameters of id for the post and assigning it to the post id in the new comment object, instead of having the hidden field in the post, this is more secure.
    @comment.post_id = params[:post_id]
    # Grabs the id for the current post and instantiates it. This was sent via the comment form on the comments/_form page
    @post = params[:post_id]

    # @post = params[:post_id]

    respond_to do |format|
      # this saves the comment object into the database and if successfully saved will redirect to the show page of the post to display the comments under the post
      if @comment.save
        # THIS IS THE SOLUTION! WOOT! post GET /posts/:id(.:format) posts#show
        # This uses the path to the show action in the posts controller and it needs an id after it so I used the post id that I created previously and made it look for that.
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  ##### ERRORS ####
  # post_comment_path - ActionController::UrlGenerationError in CommentsController#create No route matches {:action=>"show", :controller=>"comments", :post_id=>"1"} missing required keys: [:id]

  #  post_path - ActionController::UrlGenerationError in CommentsController#create No route matches {:action=>"show", :controller=>"posts", :post_id=>"1"} missing required keys: [:id]

  # @comment.post_id undefined method `to_model' for 1:Integer Did you mean? to_yaml

  # @post.id undefined method `id' for nil:NilClass
  # @post - pretty much teh same as above but saying it cannot redirect to NIL, so there is no value in this.



  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
