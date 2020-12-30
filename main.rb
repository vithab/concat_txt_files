path_array = []
path = ''
file_name = 'all_objects'

files = Dir.glob("#{path}*.txt")

files.each do |file_path|
  path_array << file_path
end

p path_array

path_array.each do |path|
  objects = File.open("#{path}", 'r') { |file| file.readlines }
  objects_array << objects.map! { |object| object.strip }
end

objects_array.map do |object|
  object.map do |obj|
    File.write("#{file_name}.txt", "#{obj}\n", mode: 'a')
    p obj
  end
end
