# Склейка нескольких txt файлов в один

time = Time.now.to_s.split(' ').first(2).join('_').gsub(':', '-')
objects_array = []

path = ''                             # задать директорию с файлами
file_name = "all_objects_#{time}"     # задать имя выходного файла
file_paths = Dir.glob("#{path}*.txt") # собираем массив путей до каждого файла

p file_paths

# Проходимся по каждому пути, читаем каждый файл и записываем в новый массив
file_paths.each do |path|
  objects = File.open("#{path}", 'r') { |file| file.readlines }
  objects_array << objects.map! { |object| object.strip }
end

# Добавляем записи с новой строки в выходной файл
objects_array.map do |object|
  object.map do |obj|
    File.write("#{file_name}.txt", "#{obj}\n", mode: 'a')
    p obj
  end
end
