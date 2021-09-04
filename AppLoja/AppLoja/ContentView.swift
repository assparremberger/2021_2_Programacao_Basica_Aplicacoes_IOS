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



//View para editar Cliente
struct EditarClienteView: View {
    
    var cliente: Cliente
    
    @State var txtNomeCliente = ""
    
    // importando o enviroment para obtermos o gerenciador do objeto, passando como Key Path o \.managedObjectContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    var body: some View{
        VStack{
            TextField("Digite o nome do cliente", text: $txtNomeCliente )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear(){
                    self.txtNomeCliente = self.cliente.nomeCli ?? "erro"
                }
                Button("Salvar Cliente"){
                    cliente.nomeCli? =  txtNomeCliente
                    cliente.managedObjectContext?.refresh(cliente, mergeChanges: true)
                    PersistenceController.banco.save()
                    self.txtNomeCliente = ""
                    presentation.wrappedValue.dismiss()
                }
        }.padding()
        .navigationBarTitle("Editar Clientes", displayMode: .inline)
    }
}



struct ClientesView: View {
    
    @State var txtNomeCliente = ""
    
    // importando o enviroment para obtermos o gerenciador do objeto, passando como Key Path o \.managedObjectContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    @FetchRequest(
        entity: Cliente.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Cliente.nomeCli, ascending: true)])
    var clientes: FetchedResults<Cliente>
    
    
    
    var body: some View{
        VStack{
            List{
                ForEach( clientes , id: \.self){ cli in
                    NavigationLink( "\(cli.nomeCli ?? " -- ") " , destination: EditarClienteView(cliente: cli) )
                }
                .onDelete(perform: removerCliente)
            }.navigationBarTitle("Clientes", displayMode: .inline)
            HStack{
                TextField("Digite o nome do cliente", text: $txtNomeCliente )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Cliente"){
                    let cliente = Cliente(context: managedObjectContext)
                    cliente.nomeCli = self.txtNomeCliente
                    PersistenceController.banco.save()
                    self.txtNomeCliente = ""
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Clientes", displayMode: .inline)
    }
    //Função para excluir Clientes
    func removerCliente(at offset: IndexSet){
        for index in offset{
            let cli = clientes[index]
            PersistenceController.banco.delete( cli )
        }
    }
}


//View para editar Produto
struct EditarProdutoView: View {
    
    var produto: Produto
    
    @State var txtNomeProduto = ""
    
    // importando o enviroment para obtermos o gerenciador do objeto, passando como Key Path o \.managedObjectContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    var body: some View{
        VStack{
            TextField("Digite o nome do produto", text: $txtNomeProduto )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear(){
                    self.txtNomeProduto = self.produto.nomeProd ?? "erro"
                }
                Button("Salvar Cliente"){
                    produto.nomeProd? = txtNomeProduto
                    produto.managedObjectContext?.refresh(produto, mergeChanges: true)
                    PersistenceController.banco.save()
                    self.txtNomeProduto = ""
                    presentation.wrappedValue.dismiss()
                }
        }.padding()
        .navigationBarTitle("Editar Produtos", displayMode: .inline)
    }
}




struct ProdutosView: View {
    
    @State var txtNomeProduto = ""
    
    // importando o enviroment para obtermos o gerenciador do objeto, passando como Key Path o \.managedObjectContext
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    @FetchRequest(
        entity: Produto.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Produto.nomeProd, ascending: true)])
    var produtos: FetchedResults<Produto>
    
    var body: some View{
        VStack{
            List{
                ForEach( produtos , id: \.self){ prod in
                    NavigationLink( "\(prod.nomeProd ?? " -- ") " , destination: EditarProdutoView(produto: prod) )
                }
                .onDelete(perform: removerProduto)
            }.navigationBarTitle("Produtos", displayMode: .inline)
            HStack{
                TextField("Digite o nome do produto", text: $txtNomeProduto )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Produto"){
                    let produto = Produto(context: managedObjectContext)
                    produto.nomeProd = self.txtNomeProduto
                    PersistenceController.banco.save()
                    self.txtNomeProduto = ""
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Produtos", displayMode: .large)

    }
    
    //Função para excluir Produtos
    func removerProduto(at offset: IndexSet){
        for index in offset{
            let prod = produtos[index]
            PersistenceController.banco.delete( prod )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
