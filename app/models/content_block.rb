class ContentBlock < ApplicationRecord
  belongs_to :presentation
  belongs_to :content_area

  validates :name, presence: true, uniqueness: { scope: :presentation_id }
  validates :presentation, presence: true
  validates :content_area, presence: true
  validate :validate_content_area_is_valid_for_presentation

  after_initialize :default_values_from_content_area
  after_save :set_as_default_if_alone

  # Makes this the default content block for this presentation/area
  def make_default
    presentation.content_blocks.where(content_area: content_area).update_all(default: false)
    self.default = true
    save
  end

  protected
  # Set default values for the content area, if applicable
  def default_values_from_content_area
    self.content_type ||= content_area.try(:content_type)
  end

  # Makes this content block the default for its presentation/area, if no default already exists
  def set_as_default_if_alone
    make_default if !default? && presentation.content_blocks.where(content_area: content_area).where(default: true).none?
  end

  # Validates that the content area of this block belongs to the same template as the presentation
  def validate_content_area_is_valid_for_presentation
    errors.add(:content_area, "not valid for this presentation's template") unless presentation && content_area && presentation.template_id == content_area.template_id
  end
end
