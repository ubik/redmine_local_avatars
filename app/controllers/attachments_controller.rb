require 'attachments_controller'
class AttachmentsController
private
  def find_project
    @attachment = Attachment.find(params[:id])
    # Show 404 if the filename in the url is wrong
    raise ActiveRecord::RecordNotFound if params[:filename] && params[:filename] != @attachment.filename
    @project = @attachment.project rescue nil
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end