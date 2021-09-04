//
//  AppLojaApp.swift
//  AppLoja
//
//  Created by Adalto Selau Sparremberger on 04/09/21.
//

import SwiftUI

@main
struct AppLojaApp: App {
    
    let persistenceController = PersistenceController.banco
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
