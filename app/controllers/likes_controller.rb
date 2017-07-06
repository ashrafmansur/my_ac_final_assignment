class LikesController < ApplicationController

  before_action :set_note

  def create
    @like = @note.likes.build
    @like.user = current_user
    if @like.save
      redirect_to note_path(@note)
    end
  end

  def destroy
    @like = Like.find_by("note_id = ? AND user_id = ?", params[:id], current_user.id)
    @like.destroy
    redirect_to note_path(@note)
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

end
