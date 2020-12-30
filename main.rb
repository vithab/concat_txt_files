path_array = []
path = ''

files = Dir.glob("#{path}*.txt")

files.each do |file_path|
  path_array << file_path
end

p path_array
