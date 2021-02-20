//
//  StoreResponse.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import Foundation
import SwiftUI

struct StoreResponse:Hashable, Codable {
    
    var totalResults: Int
    var page:Int
    var items:[Product]?
    
}

struct Product:Hashable, Codable, Identifiable {
    var id:String
    var rating:Float
    private var price:Double = 0
    var priceFormated : String{
        String(format: "$%.2f", price)
    }
    private var image:String
    var imageView: Image {
        Image(uiImage: image.loadImage())
    }
    var title:String
}
