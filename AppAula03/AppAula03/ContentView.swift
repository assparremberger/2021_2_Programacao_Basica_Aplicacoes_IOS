//
//  ContentView.swift
//  AppAula03
//
//  Created by Adalto Selau Sparremberger on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    


    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 30 ){
            
            Text("Hello, world!").font(.caption)
                .foregroundColor(Color.blue)
                .padding()
            
            Text("oi \nPessoal")
                .foregroundColor(.red)
                .font(.title)
                .multilineTextAlignment(.leading)
            
            
            
            Button(action: {
                print("Cliclado")
            }){
                Image("minhafoto")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .shadow(color:.red, radius: 10)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 10))
            }.padding()
            .foregroundColor(.blue)
            
            
            
            
        }
        .padding([.top, .bottom, .trailing], 40.0)
        .padding(.leading, 10)
        
        
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
