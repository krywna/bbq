class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :set_event, only: [:create, :destroy]

  # POST /comments or /comments.json
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to @event, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      if current_user_can_edit?(@comment)
        format.html { redirect_to redirect_to @event, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_comment
      @comment = @event.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_name)
    end
end
