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
  # Returns all of the plugin objects, preloaded as required
  def plugin_objects
    @plugin_objects ||= plugins.sort_by{|x| x =~ /^libraries\// ? 0 : 1 }.map{|p| Plugin.new(p) }
  end

  def plugin_element(element)
    content = plugin_objects.map do |plugin| # libraries get loaded first
      plugin.data[:yaml][element]
    end
    content.join("\n").html_safe
  end
end
