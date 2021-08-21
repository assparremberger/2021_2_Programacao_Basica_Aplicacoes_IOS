//
//  ContentView.swift
//  AppAula04
//
//  Created by Adalto Selau Sparremberger on 21/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var txtNome = ""
    @State var listaProd = [ Produto(id: 0, nomeProd: "teste") ]
    @State var txtTexto = ""
   
    var body: some View {
        
        TabView{
        
            VStack{
                ScrollView{
                    ScrollViewReader { reader in
                        ForEach( self.listaProd ){ prod in
                            HStack {
                                Text(prod.nomeProd)
                                Spacer()
                            }
                            .padding()
                            .onAppear{
                                reader.scrollTo((self.listaProd.count - 1))
                            }
                        }
                    }
                }
                HStack{
                    TextField("Nome do Produto: ", text: $txtNome )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Salvar"){
                        self.listaProd.append( Produto(id: self.listaProd.count, nomeProd: self.txtNome) )
                        self.txtNome = ""
                    }
                }
            }.padding(.bottom, 50)
            
            
            Link( destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/, label: {
                Text("Cliqui aqui para abrir a página")
            })
            
            
            ZStack{
                Text("Terceira Tela")
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            
            TextEditor(text: $txtTexto)
            
        }.tabViewStyle( PageTabViewStyle() )
        
        
        
        
            
    }
}
    
struct Produto: Identifiable {
    var id: Int
    var nomeProd: String
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// GridView
//let colunas = [
//    GridItem(.flexible() , spacing: 30),
//    GridItem(.flexible() , spacing: 5),
//    GridItem(.flexible() , spacing: 5)
//]
//
//var body: some View {
//
//    ScrollView{
//        LazyVGrid(columns: colunas){
//            ForEach(1...200, id: \.self){ i in
//                Text("Número: \(i)").padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
//            }
//        }
//    }.padding(10)
//
//}



//
//ScrollView{
//    ScrollViewReader { reader in
//        ForEach( self.listaProd ){ prod in
//            HStack {
//                Text(prod.nomeProd)
//                Spacer()
//            }
//            .padding()
//            .onAppear{
//                reader.scrollTo((self.listaProd.count - 1))
//            }
//
//        }
//
//    }
//}
//
//HStack{
//    TextField("Nome do Produto: ", text: self.$txtNome )
//
//    Button("Salvar"){
//        self.listaProd.append( Produto(id: self.listaProd.count, nomeProd: self.txtNome) )
//        self.txtNome = ""
//    }
//}
