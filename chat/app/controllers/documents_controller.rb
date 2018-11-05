require 'date'
class DocumentController < ApplicationController
  def new
    @document = Document.new(params.require(:document_name, :chatroom))
    @document.user = session[:current_user_id]
    @document.date_uploaded = DateTime.now
    @document.id = Documents.count - 1
  end

  def delete
    Document.delete(Document.find_by(id: params.require(:id)))
  end

  def all
    Document.find_by(chatroom: params[:chatroom]).order(:date_uploaded)
  end

  def user_params # ?
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
