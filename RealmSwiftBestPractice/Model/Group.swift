//
//  Group.swift
//  RealmSwiftBestPractice
//
//  Created by Yong Jun Cha on 2022/03/16.
//

import Foundation
import RealmSwift

class Group: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var items = RealmSwift.List<Item>()
}
