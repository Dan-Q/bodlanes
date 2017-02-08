namespace :bodlanes do
  namespace :import do
    desc 'Imports media from a folder into a presentation.'
    task media: :environment do
      STDOUT.puts "Known presentations:"
      STDOUT.puts Presentation.order(:updated_at).all.map{|p| sprintf("%4d. %s", p.id, p.name)}.join("\n")
      STDOUT.print "Import into which? "
      pid = STDIN.gets.strip.to_i
      unless (p = Presentation.find_by_id(pid))
        STDOUT.puts "Presentation #{pid} not found!"
        exit
      end
      STDOUT.print "Folder name to import from? "
      folder = STDIN.gets.strip
      files = Dir.new(folder).to_a.reject{|f| f =~ /^\.{1,2}$/}
      STDOUT.print "#{files.length} files found. That sound right? "
      if STDIN.gets.strip.downcase !~ /^y/
        STDOUT.puts "Okay. Giving up."
        exit
      end

      # Perform import
      puts "Importing:"
      files.each do |file|
        puts file
        mf = p.media_files.new
        mf.file = File::open("#{folder}/#{file}")
        mf.save
      end
    end
  end
end