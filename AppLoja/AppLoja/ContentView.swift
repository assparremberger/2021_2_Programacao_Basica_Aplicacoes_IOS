//
//  ContentView.swift
//  AppLoja
//
//  Created by Adalto Selau Sparremberger on 04/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var mostrarModal = false
    @State var mostrarTelaCheia = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Listar")){
                    NavigationLink("Clientes", destination: ClientesView())
                    NavigationLink("Produtos", destination: ProdutosView())

                }
                Section(header: Text("Configurações")){
                    Button("Abrir Modal"){
                        mostrarModal.toggle()
                    }.sheet(isPresented: $mostrarModal){
                        NavigationView{
                            Color.red.navigationBarTitle("Tela do Modal", displayMode: .inline)
                        }
                    }
                    
                    if #available(iOS 14, *){
                        Button("Sobre"){
                            mostrarTelaCheia.toggle()
                        }.fullScreenCover(isPresented: $mostrarTelaCheia, content: {
                            TelaCheiaView(mostrarTela: $mostrarTelaCheia)
                        })
                    }
                }
            }.navigationBarTitle("AppLoja", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TelaCheiaView: View {
    
    @Binding var mostrarTela: Bool
    
    var body: some View{
        ZStack{
            Color.yellow
            Button("Fechar"){
                mostrarTela.toggle()
            }
        }
    }
}


struct ClientesView: View {
    
    @State var txtNomeCliente = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        entity: Cliente.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Cliente.nomeCli, ascending: true)])
    var clientes: FetchedResults<Cliente>
    
    
    
    var body: some View{
        VStack{
            List{
                ForEach( clientes , id: \.self){ cli in
                    Text("\(cli.nomeCli ?? " -- ") ")
                }
            }
            HStack{
                TextField("Digite o nome do cliente", text: $txtNomeCliente )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Cliente"){
                    let cliente = Cliente(context: managedObjectContext)
                    cliente.nomeCli = self.txtNomeCliente
                    PersistenceController.banco.save()
                    self.txtNomeCliente = ""
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Clientes", displayMode: .inline)
    }
}


struct ProdutosView: View {
    
    @State var txtNomeProduto = ""
    
    var body: some View{
        VStack{
            List{
            
            }
            HStack{
                TextField("Digite o nome do produto", text: $txtNomeProduto )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Produto"){
                    
                    self.txtNomeProduto = ""
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Produtos", displayMode: .large)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
