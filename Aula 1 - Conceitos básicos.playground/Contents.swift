//: Primeira aula

import UIKit

var str = "Hello, playground"

var nome : String = "Gustavo"
var sobrenome : String = "Melo"

if (nome == sobrenome) {
    print("Strings são iguais")
} else {
    print("óbvio né")
}


/* ------------------- */
/* ----- aula 1 ------ */
/* ------------------- */


/* exercicio 1 */

var altura : Int = 30
var largura : Int = 60
var comprimento : Int = 34

let areaApt : Int = 60
let andar : Int = 3

var qttAptAndar =  altura/andar

var quantidadeApt : Int
quantidadeApt = ((comprimento * largura)/areaApt) * qttAptAndar

print("\n\(quantidadeApt)")


/* ----- Functions ------ */

func maior (primeiro: Int, segundo: Int) -> Int {
    if (primeiro > segundo) {
        return primeiro
    } else {
        return segundo
    }
}

var maiorNumero = maior(primeiro: 4, segundo: 6)
print(maiorNumero)


func soma (_ x: Int, _ y: Int) -> Int {
    return x + y;
}

var somaNumero = soma(1,3)
print(somaNumero)


func mult(primeiro x: Int, segundo y: Int) -> Int {
    return x * y;
}

var multiplicaNumero = mult(primeiro: 5, segundo: 0)
print(multiplicaNumero)


/* ------ Structs ------ */

struct Pessoa {
    var nome: String
}

var pessoa = Pessoa(nome: "Guga")
print(pessoa.nome)


/* ----- Closures ------ */

var numeros : [Int] = [1,2,3,4,5,6]

var numeroOrdenados = numeros.sorted(by: {
    (x: Int,y: Int) -> Bool in return x > y
})

var numeroOrdenados1 = numeros.sorted(by: {
    x,y in return x > y
})

var numeroOrdenados2 = numeros.sorted(by: {
    x,y in x > y
})

var numeroOrdenados3 = numeros.sorted(by: >)



/* ----- Exercicio 2 ------ */

func verificarAnoBisesexto(anoInformado: Int) -> Bool {
    return ( (anoInformado % 4 == 0) && (anoInformado % 100 != 0) )
}

let anoDado = 2012

var respostaAnoBissexto = verificarAnoBisesexto(anoInformado: anoDado)
print(respostaAnoBissexto)


let anoArray = [2012, 2018]
var respostaTupla = anoArray.filter(verificarAnoBisesexto)
print(respostaTupla)



/* ------------------- */
/* ----- aula 2 ------ */
/* ------------------- */



