//
//  ContentView.swift
//  AppCompras
//
//  Created by Adalto Selau Sparremberger on 21/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var txtNome = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Produto.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Produto.nome, ascending: true)]
    ) var produtos : FetchedResults<Produto>
    
    
    
    var body: some View {
        VStack{
            
            List{
                ForEach( produtos, id: \.self ) { prod in
                    Text("\(prod.nome ?? "[erro]")  ")
                }
                .onDelete( perform: removerItem)
            }
            
            HStack{
                TextField("Nome do Produto: ", text: $txtNome )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar"){
                    let novoProduto = Produto(context: managedObjectContext)
                    novoProduto.nome = self.txtNome
                    PersistenceController.banco.save()
                    self.txtNome = ""
                }
            }
        }.padding(.all, 10)
    }
    
    func removerItem(at offset: IndexSet){
        for index in offset{
            let prod = produtos[index]
            PersistenceController.banco.delete( prod )
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
