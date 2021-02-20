//
//  ContentView.swift
//  TestGapsi
//
//  Created by Marco Antonio Martínez Gutiérrez on 20/02/21.
//

import SwiftUI
import Alamofire
import RealmSwift


struct ContentView: View {
    
    @State private var product: String = ""
    var presenter: ViewToPresenterProtocol
      @ObservedObject var store: ProductStore
    
    let realm = try! Realm()
    @State private var results:[Query] = []
        
    
    init(_ store: ProductStore, _ presenter: ViewToPresenterProtocol) {
        self.store = store
        self.presenter = presenter
    }
    
    
    var body: some View {
        VStack {
            HStack{
                TextField("Search", text: $product)
                Button(action: {
                    presenter.searchProduct(product: "\(product)")
                }, label: {
                    Text("Search")
                })
            }.padding()
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ForEach(results, id:\.self) { result in
                        Button(action: {
                            presenter.searchProduct(product: "\(result.query)")
                        }, label: {
                            Text(result.query)
                        })
                    }
                }
                
            }.onAppear{
                self.results = realm.objects(Query.self).sorted(byKeyPath: "query", ascending: true).map{$0}
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationView { () -> AnyView in
                switch store.state {
                case .loading:
                    return AnyView(Text("loading"))
                case .error(let message):
                    return AnyView(Text(message))
                case .loaded(let products): return AnyView(ProductsList(products: products).onAppear{
                    product = ""
                    self.results = realm.objects(Query.self).sorted(byKeyPath: "query", ascending: true).map{$0}
                })
                default: return AnyView(Text(""))
                }
            }
        }
    }
    
    
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store,c)
    }
}*/

extension ContentView {

  
}
