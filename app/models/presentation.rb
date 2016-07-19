class Presentation < ApplicationRecord
  belongs_to :template
  has_many :content_blocks, dependent: :destroy
  has_many :media_files, dependent: :destroy
end
