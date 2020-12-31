# Склейка нескольких txt файлов в один

time = Time.now.strftime("%d-%m-%Y_%H-%M-%S")

path = ''                             # задать абсолютную директорию с файлами
file_name = "all_objects_#{time}"     # задать имя выходного файла
file_paths = Dir.glob("#{path}*.txt") # собираем массив путей до каждого файла

# Проходимся по каждому пути, читаем каждый файл и записываем в новый массив
objects_array = file_paths.each_with_object( [] ) do |path, array|
  objects = File.open("#{path}", 'r') { |file| file.readlines }
  array << objects.map! { |object| object.strip }
end

# Добавляем записи с новой строки в выходной файл
objects_array.map do |object|
  object.map do |obj|
    File.write("#{file_name}.txt", "#{obj}\n", mode: 'a')
    p obj
  end
end
