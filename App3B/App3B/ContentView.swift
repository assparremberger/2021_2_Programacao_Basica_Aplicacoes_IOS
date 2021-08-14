//
//  ContentView.swift
//  App3B
//
//  Created by Adalto Selau Sparremberger on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var texto = ""
    @State var mostarAlerta = false
    @State var idade = 0
    
    var body: some View {
        
            
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                Text("Nome: ")
                
                TextField("Didite aqui..", text: $texto).border(Color.red)
               // Spacer(minLength: 60)
                Quadradinhos()
            }
            
            HStack(alignment: .center, spacing: 5){
                Text("Idade: \(idade)")
                
                Stepper(value: $idade, in: 0...120){
                    //Text("\(idade) anos")
                }
                
            }
            
            Quadradinhos()
            Button(action: {
                self.mostarAlerta = true
                print("log")
            }){
                Text("Mostrar Alerta")
            }
            Quadradinhos()
            
            
           
            
        }.padding(10)
        .alert(isPresented: $mostarAlerta){ () -> Alert in
            return Alert(title: Text("Atenção"),
                         message: Text("Olá \(texto)"),
                         dismissButton: .default( Text("OK") ))
        }
            
        
    }
}

struct Quadradinhos : View {
    var body: some View{
        ZStack(alignment: .center, content: {
           
        }).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 10)
        .padding(30)
        .background(Color.yellow, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //ContentView().previewLayout(.fixed(width: 800, height: 200))
    }
}
