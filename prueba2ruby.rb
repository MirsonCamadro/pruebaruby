def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end
# Alumnos ausentes tienen nota 0
# opcion 3 debe preguntar cual es la nota de aparovacion, si no ingresa nada debe ser 5

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

  def absences
    grades_list = read_alum('gradestable.csv')
    grades_list.each do |total_grades|
      count_absences = 0
      total_grades.each_with_index do |grades, index|
        count_absences += 1 if grades == 'A' && index != 0
      end
      puts "El alumno #{total_grades[0]} no registra inasistencias." if count_absences == 0
      puts "El alumno #{total_grades[0]} registra #{count_absences} inacistencia." if  count_absences == 1
      puts "El alumno #{total_grades[0]} registra #{count_absences} inacistencias." if  count_absences > 1
    end
  end

  def approved_students
    grades_list = read_alum('gradestable.csv')
    puts 'ingrese nota de aprobacion (nota default: 5.0, solo presione enter)'
    approval_grade = gets.chomp.to_f
    if approval_grade >= 0 && approval_grade <= 10
      grades_list.each do |total_grades|
        sum_grades = 0
        count_grades = total_grades.size - 1
          total_grades.each_with_index do |grades, index|
            sum_grades += grades.to_i if index != 0
          end
        average = sum_grades.to_f / count_grades
        puts "El alumno #{total_grades[0]} aprobo el año escolar con una nota de #{average}" if average >= approval_grade && approval_grade != 0
        puts "El alumno #{total_grades[0]} aprobo el año escolar con una nota de #{average}" if average >= 5 && approval_grade == 0
      end
    else
      puts 'ingrese opcion valida, notas del 1-10'
    end
  end

  case option
  when 1
    line_break
    average
    line_break
  when 2
    line_break
    absences
    line_break
  when 3
    line_break
    approved_students
    line_break
  when 4
    line_break
    puts 'Hasta pronto, have a nice day (ᵔᴥᵔ) '
    line_break
  else
    line_break
    puts 'Opcion no valida, porfavor ingrese opcion del 1-4'
    line_break
  end
end
