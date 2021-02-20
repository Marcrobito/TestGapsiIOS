//
//  Model.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import Foundation
import Alamofire
import RealmSwift

class Model: PresenterToModelProtocol {
    let BASE_URL = "https://00672285.us-south.apigw.appdomain.cloud/demo-gapsi/"
    let headers: HTTPHeaders = ["X-IBM-Client-Id":"adb8204d-d574-4394-8c1a-53226a40876e"]
    var presenter: ModelToPresenterProtocol?
    
    let realm = try! Realm()
    
    func fetchProduct(product: String) {
        
        var exists =  realm.objects(Query.self).filter("query == '\(product)'").first
        if exists == nil {
            let query = Query()
            query.query = product
            try! realm.write {
                realm.add(query)
            }
        }
        print(exists)
        
        let request = AF.request("\( BASE_URL)search?&query=\(product)", headers: headers)
        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                do{
                    let result = try JSONDecoder().decode(StoreResponse.self, from: response.data!)
                    self.presenter?.fetchedProduct(products: result.items!)
                }catch{
                    self.presenter?.errorFetchingProducts(error: error.localizedDescription)
                }
            case .failure(let error):
                self.presenter?.errorFetchingProducts(error: error.errorDescription ?? "No se logro completar la consulta")
            }
        }
    }
    
    
}
