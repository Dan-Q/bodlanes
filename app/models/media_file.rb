class MediaFile < ApplicationRecord
  belongs_to :presentation

  has_attached_file :file, path: :file_path, url: :file_url
  do_not_validate_attachment_file_type :file

  validates :file_file_name, uniqueness: { scope: :presentation_id }

  scope :image, -> { where("file_content_type LIKE 'image/%'") }

  # Returns true if the media file is an image
  def image?
    file_content_type =~ /^image\//
  end

  protected
  # Provides paperclip with the path at which a file should be stored
  def file_path
    ":rails_root/public/media/#{presentation_id}/:filename"
  end
  # Provides paperclip with the path from which a file should be served
  def file_url
    "/media/#{presentation_id}/:filename"
  end
end
