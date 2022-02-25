class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: %i[ show edit update destroy ]
  before_action :set_discussion

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = @discussion.replies.new 
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies or /replies.json
  def create
    @reply = @discussion.replies.create(reply_params)
    @reply.user_id = current_user.id
    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion), notice: "Reply was successfully created." }
        format.js
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { redirect_to discussion_path(@discussion), notice: "Reply wasn't successfully created."  } 
        format.js
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to discussion_path(@discussion), notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:reply)
    end
end
