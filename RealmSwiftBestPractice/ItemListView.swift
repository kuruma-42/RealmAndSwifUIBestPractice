//
//  ItemListView.swift
//  RealmSwiftBestPractice
//
//  Created by Yong Jun Cha on 2022/03/16.
//

import SwiftUI
import RealmSwift

struct ItemListView: View {
    
    // State Alternative
    @ObservedRealmObject var group : Group
    
    
    var body: some View {
        NavigationView{
            List {
                ForEach(group.items.freeze()) { item in
                    ItemRow(item: item)
                }
                .onMove(perform: $group.items.move)
                .onDelete(perform: $group.items.remove)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Items", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        $group.items.append(Item())
                    } label: {
                        Image(systemName: "plus")
                    }.frame(maxWidth: .infinity, alignment: .trailing)

                }
            }
        }
     
    }
}

struct ItemRow: View {
    @ObservedRealmObject var item: Item

    var body: some View {
        NavigationLink {
            ItemDetailView(item: item)
        } label: {
            Text(item.name)
            if item.isFavorite {
                Image(systemName: "heart.fill")
            }
        }

    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(group: Group())
    }
}
