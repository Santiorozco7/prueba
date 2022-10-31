defmodule Challenge1 do
  def divisible3(a, b) do
    inicio = inicio(a, 0, "")
    secuencia = secuencia(a, b, inicio, [inicio])
    divisible(secuencia, [], 0)
  end

  # Obtener el primer datos de la secuencia
  def inicio(a, aux, str) when aux == a do
    String.to_integer(str)
  end

  def inicio(a, aux, str) when aux < a do
    aux = aux + 1
    str = str <> "#{aux}"
    inicio(a, aux, str)
  end

  # Obtener toda la secuencia
  def secuencia(a, b, _inicio, list) when a == b do
    list
  end

  def secuencia(a, b, inicio, list) when a < b do
    a = a + 1
    str = "#{inicio}" <> "#{a}"
    num = String.to_integer(str)
    new_list = [num | list]
    secuencia(a, b, num, new_list)
  end

  # Encontrar y almacenar los datos y la cantidad de datos divisibles por 3
  def divisible(hd, list, count) when hd == [] do
    print(list, count, "", 0)
  end

  def divisible([hd | tl], list, count) when rem(hd, 3) == 0 do
    new_list = [hd | list]
    count_aux = count + 1
    divisible(tl, new_list, count_aux)
  end

  def divisible([hd | tl], list, count)when rem(hd, 3) != 0 do
    divisible(tl, list, count)
  end

  # Imprimir la secuencia que son divisibles por 3
  def print([hd | tl], _count, str, _aux) when tl == [] do
    str = str <> " #{hd}"
    IO.puts(str)
  end

  def print([hd | tl], count, str, aux) when aux == 1 do
    str = str <> " #{hd},"
    print(tl, count, str, aux)
  end

  def print(list, count, _str, aux) when aux == 0 do
    aux = 1
    str = "La cantidad de números divisibles por 3 son #{count}, estos son:"
    print(list, count, str, aux)
  end
end

# Example Challenge1.divisible3(3, 5)
