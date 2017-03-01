class Plugin
  attr_reader :data

  def initialize(name)
    if File.file?(yml = "#{Rails.root}/lib/bodlanes-plugins/#{name}.yml")
      @data = {name: name, yaml: YAML.load(File.open(yml))}
    elsif File.directory?(plugin = "#{Rails.root}/lib/bodlanes-plugins/#{name}.plugin")
      @data = {name: name, yaml: {}}
      Dir.glob("#{plugin}/*").each do |file|
        next unless file =~ /\/([^\/]+)\.([^\/\.]+?)$/
        @data[:yaml][$1] = File.read(file)
      end
    else
      raise "Missing or incompatible plugin: #{name}"
    end
  end
end
