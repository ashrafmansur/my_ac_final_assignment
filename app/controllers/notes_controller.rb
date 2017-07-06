class NotesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all.order("created_at DESC")

    if user_signed_in?
      userfeed
    end

  end

  def show
    @likes = @note.likes
    @currentlikers = @likes.pluck(:user_id)
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    if @note.user = current_user
      @note.destroy
      redirect_to notes_path
    else
      render :edit
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body)
  end

  def userfeed
    @user = current_user

    if @user.followings.count == 0
      @notes = Note.all.order("created_at DESC")
    else
      @notes = feed.order("created_at DESC")
    end
  end

  def feed
    feed_ids = @user.followings.map{ |x| x.followee_id }
    feed_ids << @user.id
    Note.where(user_id: feed_ids)
  end

end
