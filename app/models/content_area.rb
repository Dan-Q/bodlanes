class ContentArea < ApplicationRecord
  belongs_to :template
  has_many :content_blocks
end
