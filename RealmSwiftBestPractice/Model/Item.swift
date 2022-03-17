//
//  Item.swift
//  RealmSwiftBestPractice
//
//  Created by Yong Jun Cha on 2022/03/16.
//

import Foundation
import RealmSwift

class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomAdjectives.randomElement()!)"
    @Persisted var isFavorite = false
    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
    
    convenience init(name: String, isFavorite: Bool) {
        self.init()
        self.name = name
        self.isFavorite = isFavorite
    }
    
    static func previewExample() -> Item {
        Item(name: "fluffy preview", isFavorite: true)
    }
}



let randomAdjectives = [
    "fluffy", "classy", "bumpy", "bizarre", "wiggly", "quick", "sudden",
    "acoustic", "smiling", "dispensable", "foreign", "shaky", "purple", "keen",
    "aberrant", "disastrous", "vague", "squealing", "ad hoc", "sweet"
]

let randomNouns = [
    "floor", "monitor", "hair tie", "puddle", "hair brush", "bread",
    "cinder block", "glass", "ring", "twister", "coasters", "fridge",
    "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace",
    "cork", "mouse pad"
]
