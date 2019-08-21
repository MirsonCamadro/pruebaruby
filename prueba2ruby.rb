def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end
# Alumnos ausentes tienen nota 0
# opcion 3 debe preguntar cual es la nota de parovacion, si no ingresa nada debe ser 5

option = 0
while option != 4
  puts '
  Bienvenido, ingrese una opcion:

    1) Alumnos y sus promedios

    2) Alumnos y sus inacistencias

    3) Alumnos aprobados

    4) Salir'

option = gets.chomp.to_i

def line_break
  puts '--------------------------------------------------------------'
end

def average
  grades_list = read_alum('gradestable.csv')
  grades_list.each do |total_grades|
    sum_grades = 0
    count_grades = total_grades.size - 1
      total_grades.each_with_index do |grades, index|
        sum_grades += grades.to_i if index != 0
      end
    average = sum_grades.to_f / count_grades
    puts "El alumno #{total_grades[0]} obtuvo un promedio de #{average}"
  end
end





  case option
  when 1
    average
    line_break
  when 2
    line_break
  when 3
    line_break
  when 4
    puts 'Hasta pronto, have a nice day (ᵔᴥᵔ) '
    line_break
  else
    puts 'Opcion no valida, porfavor ingrese opcion del 1-4'
    line_break
  end


end
