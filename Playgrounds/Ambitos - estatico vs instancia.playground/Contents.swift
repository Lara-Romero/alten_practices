import UIKit

class Prueba{
    //estáticos: cuando creamos una variable de tipo estática
    static var nombre: String = "Lara estática"
    
    //instancias: no hay que poner modificador delante de la variable
    var apellidos: String = "Romero instancia"
}

//Vemos como podemos acceder a cada uno de ellos
//Para acceder a una static tenemos que acceder por la clase:  <nombre de la clase>.<variable>
print(Prueba.nombre)

//Para acceder a una variable de instancia, tenemos que crearnos primero una instancia:
//Inicializar la clase y acceder a la variable usando la anterior variable creada
let miVariable = Prueba()
print(miVariable.apellidos)

//Una vez cambiamos el valor de la variable, la variable sigue de aquí en adelante con el valor nuevo que le hayamos dado
print(Prueba.nombre)
Prueba.nombre = "Pepe estático"
print(Prueba.nombre)


//Aunque cambiemos el valor de para una instancia, si volvemos a utilizar otra, partimos del valor que pusimos en primer lugar:
let miVariable1 = Prueba()
print(miVariable1.apellidos)
miVariable1.apellidos = "García instancia"
print(miVariable1.apellidos)

let miVariable2 = Prueba()
print(miVariable2.apellidos)
