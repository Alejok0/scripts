function limpiarPantalla()
  if not os.execute("clear") then
    os.execute("cls")
  end
end

function dibuja_parte_superior()
  io.write("+----+  \n")
  io.write("|    |  \n")
end

function dibuja_parte_central(errores)
  if(errores == 0) then
    io.write("|       \n")
  end if(errores >= 1) then
    io.write("|    O  \n")
  end if(errores >= 2 and errores <3 ) then
    io.write("|    |  \n")
  end if(errores >= 3 and errores <4 )then
    io.write("|   /|  \n")
  end if(errores >= 4 ) then
    io.write("|   /|\\ \n")
  end if(errores >= 5 and errores<6) then
    io.write("|   /   \n")
  end if(errores >= 6) then
    io.write("|   / \\ \n")
  end
end


function dibuja_parte_inferior()
  io.write("|       \n")
  io.write("|       \n")
  io.write("+------\n")
  io.write("")
end


function dibuja_ahorcado(errores)
  dibuja_parte_superior()
  dibuja_parte_central(errores)
  dibuja_parte_inferior()
end

function dibuja_palabra(palabra)
  local guiones = ""
  local letras = ""
  local contador = 1
  while contador <= string.len(palabra) do
    guiones = guiones.."-"
    letras = letras..string.sub(palabra,contador,contador)
    contador = contador + 1
  end
  io.write(letras.."\n")
  io.write(guiones.."\n")
end

function reemplazaLetras(palabra)
  local letras = ""
  local contador = 1
  while contador <= string.len(palabra) do
    letras = letras.."x"
    contador = contador + 1
  end
  return letras
end

function rellenaPalabraMostrar(palabraMostrar, palabra, letra)
  local letras = ""
  local contador = 1
  while contador <= string.len(palabra) do
    if string.sub(palabra,contador,contador) == letra then
      letras = letras..letra
    else
      letras = letras..string.sub(palabraMostrar,contador,contador)
    end
    contador = contador + 1
  end
  return letras
end

function letraValida(palabra, letra)
 return string.find(palabra, letra)
end

function main()
  local frutas = {"manzana", "platano", "naranja", "pera", "fresa",
                "kiwi", "uva", "mango", "melon", "sandia",
                "toronja", "cereza", "limon", "mandarina", "pomelo",
                "aguacate", "nispero", "frambuesa", "grosella", "coco"}

  local errores, palabra, palabraMostrar, puntos, victorias, derrotas
  local continuar = true

   victorias = 0
   derrotas = 0

  while continuar do
    errores = 0
    palabra = frutas[math.random(1,20)]
    palabraMostrar = reemplazaLetras(palabra)
    while errores < 6 do
      limpiarPantalla()
      dibuja_ahorcado(errores)
      io.write("Victorias: ".. victorias.."\t ".."Derrotas: "..derrotas.."\t".."Errores: "..errores.."/6".."\n")
      io.write("Adivina de que fruta estamos hablando . . .\n")
      dibuja_palabra(palabraMostrar)
      local letra = io.read("l")
      letra = letra:lower()

      if letraValida(palabra,letra) then
        palabraMostrar = rellenaPalabraMostrar(palabraMostrar,palabra,letra)
      else
        errores = errores + 1
      end

      if(errores>=6) then
        derrotas = derrotas +1
        break
      end

      if(palabraMostrar == palabra) then
        victorias = victorias +1
        break
      end
    end
  end
end


main()