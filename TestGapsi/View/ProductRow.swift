//
//  ProductRow.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import SwiftUI

struct ProductRow: View {
    var product:Product
    var body: some View {
        HStack {
            product.imageView
                .resizable()
                .frame(width: 60, height: 60)
            Text(product.title)
                .lineLimit(2)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text(product.priceFormated)
                .foregroundColor(.green)
                .multilineTextAlignment(.trailing)
        }
        
    }
}

/*struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow()
    }
}*/
