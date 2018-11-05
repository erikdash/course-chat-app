require 'date'
class DocumentController < ApplicationController
  def new
    @document = Document.new(params.require(:document_name, :chatroom))
    @document.user = session[:current_user_id]
    @document.date_uploaded = DateTime.now
    @document.id = Documents.count - 1
  end

  def delete
    Messages.delete(Messages.find_by(id: params.require(:id)))
  end
end
