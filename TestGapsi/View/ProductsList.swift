//
//  ProductsList.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import SwiftUI

struct ProductsList: View {
    var products:[Product]
    var body: some View {
        List(products){ product in
            ProductRow(product: product)
        }
    }
}

/*struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList()
    }
}*/
