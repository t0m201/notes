class NotesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = "Successfully created..."
      redirect_to notes_path
    else
      flash[:error] = "ERROR"
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
   @note = Note.find(params[:id])
   if @note.update_attributes(note_params)
     flash[:success] = "Updated!"
     redirect_to notes_path
   else
     render 'edit'
   end
 end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
    Note.find(params[:id]).destroy if Note.find(params[:id])
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:id, :title, :body)
  end

end
