//
//  Presenter.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import Foundation

class Presenter: ViewToPresenterProtocol {
    
    var model: PresenterToModelProtocol?
    weak var delegate: PresenterDelegate?
    
    func searchProduct(product: String) {
        model?.fetchProduct(product: product)
        self.delegate?.renderLoading()
    }
    
}

extension Presenter: ModelToPresenterProtocol{
    func errorFetchingProducts(error: String) {
        self.delegate?.render(errorMessage: "No se encontraron productos")
    }
    
    func fetchedProduct(products: [Product]) {
        if products.count > 0 {
            self.delegate?.render(products: products)
        }else{
            self.delegate?.render(errorMessage: "No se encontraron productos")
        }
    }
}
