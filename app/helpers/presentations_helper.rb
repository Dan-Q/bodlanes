module PresentationsHelper
  def presentation_partial(filename)
    ERB::new(File::read("#{Rails.root}/app/views/#{filename}")).result(binding).html_safe
  end
end
