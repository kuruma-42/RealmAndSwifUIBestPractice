//
//  ItemDetailView.swift
//  RealmSwiftBestPractice
//
//  Created by Yong Jun Cha on 2022/03/16.
//

import SwiftUI
import RealmSwift

struct ItemDetailView: View {
    @ObservedRealmObject var item : Item
//
//    @Environment(\.realm) var realm
//    @Environment(\.realmConfiguration) var configuration
    var body: some View {
        VStack(alignment: .leading){
            Text("Enter a new name:")
            
            TextField("New name", text: $item.name)
                .textFieldStyle(.roundedBorder)
            
                .navigationBarTitle(item.name)
                .navigationBarItems(trailing: Toggle(isOn: $item.isFavorite, label: {
                    Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                }))
            
            Button {
                    if let newItem = item.thaw(),
                       let realm = newItem.realm {
                    
                    try? realm.write {
                        realm.delete(newItem)
                    }
                }
            } label: {
                Text("delete")
            }
            .padding()
        }
      
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetailView(item: Item.previewExample())
        }
    }
}
