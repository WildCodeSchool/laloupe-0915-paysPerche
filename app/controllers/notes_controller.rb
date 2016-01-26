class NotesController < ApplicationController

  def create
    @contact = Contact.find(params[:contact_id])
    @note = @contact.notes.create(note_params)
    @note.user_id = current_user.id if current_user
    @note.save
    if @note.save
      redirect_to contact_path(@contact), notice: "Votre note a été bien ajoutée"
    else
      render "form"
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
