//
//  TestContract.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import Foundation



protocol ViewToPresenterProtocol: AnyObject {
    var model:PresenterToModelProtocol? { get set }
    var delegate: PresenterDelegate? { get set }
    func searchProduct(product:String)
}

protocol PresenterToViewProtocol: AnyObject {
    
}

protocol PresenterDelegate: AnyObject {
  func render(errorMessage: String)
  func renderLoading()
  func render(products: [Product])
}


protocol PresenterToModelProtocol: AnyObject {
    var presenter:ModelToPresenterProtocol? { get set }
    func fetchProduct(product:String)
}

protocol ModelToPresenterProtocol: AnyObject {
    func fetchedProduct(products:[Product])
    func errorFetchingProducts(error:String)
}
