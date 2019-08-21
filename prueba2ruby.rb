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

  case option
  when 1
  when 2
  when 3
  when 4
    puts 'Hasta pronto, have a nice day (ᵔᴥᵔ) '
  else
    puts 'Opcion no valida, porfavor ingrese opcion del 1-4'
  end


end
