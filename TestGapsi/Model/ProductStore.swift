//
//  ProductStore.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import Foundation

class ProductStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(_ products: [Product])
        case notInitializated
    }
    
    @Published var state: State = .notInitializated
}

extension ProductStore: PresenterDelegate{
    func render(errorMessage: String) {
        self.state = .error(message: errorMessage)
    }
    
    func renderLoading() {
        self.state = .loading
    }
    
    func render(products: [Product]) {
        self.state = .loaded(products)
    }
    
}
