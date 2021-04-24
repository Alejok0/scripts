import os
import sys

tablero = [" "," "," "," "," "," "," "," "," "]

def limpiarPantalla():
    osis = sys.platform
    if(osis=="linux2" or osis =="linux"):
        os.system("clear")
    else:
        os.system("cls")

def dibujarTablero():
  print("Juego del gato")
  print(tablero[0] + " | " + tablero[1] + " | "+tablero[2]+"\t"+"1 | 2 | 3")
  print("--------- \t---------")
  print(tablero[3] + " | " + tablero[4] + " | "+tablero[5]+"\t"+"4 | 5 | 6")
  print("--------- \t---------")
  print(tablero[6] + " | " + tablero[7] + " | "+tablero[8]+"\t"+"7 | 8 | 9")

def validarCasilla(numero):
  if(tablero[numero]==" "):return True
  else: return False

def asignarCasilla(numero):
    tablero[numero] = "X"

#Solo pone en la primera posicion que encuentra libre
def enemigoResponde():
    if(not estaLleno()):
        for c in range(0,8):
            if validarCasilla(c):
                tablero[c] = "O" 
                break

#Primero valida las lineas en horizontal
#Despues valida las lineas en vertical
#Posteriormente valida las diagonales
#Al final valida si el tablero esta lleno
def validarFin():
    signo =  ["O","X"]
    
    for i in signo:
        for c in range(0,7,3):
            if(tablero[c]==i):
                if(tablero[c+1]==i):
                    if(tablero[c+2]==i):
                        print("El jugador "+i+" ganó")
                        return True

        for c in range(0,3):
            if(tablero[c]==i):
                if(tablero[c+3]==i):
                    if(tablero[c+6]==i):
                        print("El jugador "+i+" ganó")
                        return True

        if(tablero[0]==i):
            if(tablero[4]==i):
                if(tablero[8]==i):
                    print("El jugador "+i+" ganó")
                    return True
    
        if(tablero[2]==i):
            if(tablero[4]==i):
                if(tablero[6]==i):
                    print("El jugador "+i+" ganó")
                    return True

    return estaLleno()

def estaLleno():
    for i in range(0,9):
        if(tablero[i]==" "):
            return False
        if(i==8):
            print("Nadie ganó")
            return True

def main():
  while True:
    limpiarPantalla()
    dibujarTablero()
    
    if(validarFin()):
        break

    print("Digite el numero de alguna casilla")
    numero = int(input())
    numero -=1

    if(numero > 8 or numero < 0):
      print("Opcion no disponible: "+str(numero+1))
    else:
        if(validarCasilla(numero)):
            asignarCasilla(numero)
            enemigoResponde()
        else:
            print("Opcion no disponible: "+str(numero+1))

main()
