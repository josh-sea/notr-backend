class Api::V1::NotesController < ApplicationController
  def index
    @notes = Note.all
    render json: @notes, status: :ok
  end

  # def test
  #     # Fetch and parse HTML document
  #     doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{params[:search]}"))
  #     @content = doc.css('.mw-parser-output')
  #     @html="<body>#{@content}</body>"
  #     @testing="<html>#{@html}</html>"
  #     render html: @testing.html_safe
  #   end

  def create
    @note = Note.create(note_params)
    ActionCable.server.broadcast('new_note', {note: @note, request: 'new'})
    # render json: @note, status: :ok
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    ActionCable.server.broadcast('new_note', {note: @note, request: 'edit'})
    # render json: @note, status: :ok
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    ActionCable.server.broadcast('new_note', {note: @note, request: 'delete'})
    # render json: @note, status: :ok
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :user_id, :classroom_id)
  end
end
