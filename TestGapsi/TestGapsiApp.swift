//
//  TestGapsiApp.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import SwiftUI

@main
struct TestGapsiApp: App {
    
    let model:PresenterToModelProtocol = Model()
    let presenter : ViewToPresenterProtocol & ModelToPresenterProtocol = Presenter()
    
    let store:PresenterDelegate = ProductStore()
    

    
    init(){
        presenter.model = model
        model.presenter = presenter
        presenter.delegate = store
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView((self.store as! ProductStore), self.presenter)
        }
    }
}
