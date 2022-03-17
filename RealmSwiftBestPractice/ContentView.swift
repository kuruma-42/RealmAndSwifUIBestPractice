//
//  ContentView.swift
//  RealmSwiftBestPractice
//
//  Created by Yong Jun Cha on 2022/03/16.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedResults(Group.self) var groups
    var body: some View {
        if let group = groups.first {
            ItemListView(group: group)
        } else {
            ProgressView()
                .onAppear {
                    $groups
                        .append(Group())
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
