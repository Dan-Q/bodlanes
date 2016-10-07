namespace :bodlanes do
  desc 'Exports one or more presentations.'
  task export: :environment do
    app = ActionDispatch::Integration::Session.new(Rails.application)
    STDOUT.puts "Known presentations:"
    STDOUT.puts Presentation.order(:updated_at).all.map{|p| sprintf("%4d. %s", p.id, p.name)}.join("\n")
    STDOUT.print "Export which? (any number of presentations, comma-separated): "
    STDIN.gets.strip.split(',').each do |pid|
      if(p = Presentation.find_by_id(pid))
        out = "#{Rails.root}/export/#{pid}"
        STDOUT.print "Exporting '#{p.name}' to #{out}"
        `rm -rf #{out}` if File.exists?(out)
        `mkdir -p #{out}/media/#{pid}`
        app.get("/presentations/#{pid}/preview?for=download")
        File.write("#{out}/index.html", app.response.body.gsub('/media/', 'media/'))
        STDOUT.print '.'
        p.media_files.each do |m|
          `cp -r #{m.file.path} #{out}/media/#{pid}/`
          STDOUT.print '.'
        end
        STDOUT.puts " done!"
      else
        STDOUT.puts "Presentation #{pid} not found!"
      end
    end
  end
end