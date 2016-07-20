class Presentation < ApplicationRecord
  belongs_to :template
  has_many :content_blocks, dependent: :destroy
  has_many :media_files, dependent: :destroy

  serialize :plugins, Array

  def plugins_enabled
    (self.plugins || []).join(',')
  end

  def plugins_enabled=(plugins_list)
    self.plugins = plugins_list.split(',')
  end

  def plugin_css
    plugin_element 'css'
  end

  def plugin_js
    plugin_element 'js'
  end

  private
  def plugin_element(element)
    content = plugins.map do |plugin|
      if File::exists?(filename = "#{Rails.root}/lib/bodlanes-plugins/#{plugin}.yml")
        YAML.load_file(filename)[element]
      else
        "/* Plugin not found: #{plugin} */"
      end
    end
    content.join("\n").html_safe
  end
end
