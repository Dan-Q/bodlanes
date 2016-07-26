class Template < ApplicationRecord
  belongs_to :screen_type
  has_many :content_areas, dependent: :destroy
  has_many :presentations

  validates :name, uniqueness: { scope: :screen_type_id }
  validates :code, uniqueness: true

  def full_name
    "[#{screen_type.name}] #{name}"
  end
end
