json.array!(@media_files) do |media_file|
  json.extract! media_file, :id, :presentation_id, :file_file_name, :file_content_type, :file
end
