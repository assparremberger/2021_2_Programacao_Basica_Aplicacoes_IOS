import UIKit

var greeting = "Hello, playground"


func ola(nome: String, sobrenome: String) -> String{
    return "Olá \(nome) \(sobrenome) "
}

func getPI( ) -> Double{
    return 3.14
}

ola(nome: "Adalto", sobrenome: "Selau")

print( getPI() )

class Produto{
    var nome: String
    var preco: Double
    
    init(nome: String, preco: Double){
        self.nome = nome
        self.preco = preco
    }
    
    func imprimir() {
        print( "Nome: \(self.nome)\nPreço: \(preco)")
    }
    
}

var p = Produto(nome: "Pepsi", preco: 3.99)
p.imprimir()


var x = 5

while x > 0{
    print( x )
    x -= 1
}

repeat{
    print( x )
    x += 1
}while x < 3

x=2
switch x {
case 1, 2:
    print("Não é 3")
case 3:
    print("É tres")
default:
    print("é outro")
}

// Imperativo
let numeros = [1,2,3,4,5]

var pares = [Int]()
for i  in 0..<numeros.count{
    if numeros[i] % 2 == 0{
        pares.append( numeros[i] )
    }
}

// Funcional
let pares2 = [1,2,3,4,5].filter{
    (numero) -> Bool in
    if( numero % 2 == 0 ){
        return true
    }else{
        return false
    }
}

print( pares )
print( pares2 )

func funcao() -> String?{
    return nil
}

let opcional: String? = "opcional"

let op2: String?  = Optional.some("op02")
let op3: String?  = Optional.none

let retorno: String? = funcao()

var prod = Dictionary<String, Any>()
prod = ["café": 8.99 , "Coca-cola" : 5.98]
print( prod )
print( prod["café"]! )
//prod.removeValue(forKey: "café" )
print( prod )

print ( "----------")

for (name, price) in prod {
    print( "\(name): \(price) ")
}


struct Person{
    var nome: String?
    var altura: Double
    
    init(nome: String = "joão", altura: Double = 0){
        self.nome = nome
        self.altura = altura
    }
    
    func getDados() -> String?{
        return "\(self.nome!) - \(self.altura)"
    }
    
}

var p2 = Person( altura: 1.85 )
