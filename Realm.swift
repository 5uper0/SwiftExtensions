//
//  Realm.swift
//  cargo
//
//  Created by Victor Amelin on 2/23/17.
//  Copyright © 2017 Victor Amelin. All rights reserved.
//

import RealmSwift

public extension Object {
    public func add() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.add(self, update: true)
        }
    }
    
    public func update(updateBlock: EmptyHandler) {
        let realm = try? Realm()
        try! realm?.write(updateBlock)
    }
    
    public func delete() {
        let realm = try? Realm()
        try! realm?.write({
            realm?.delete(self)
        })
    }
}

public class RealmHelper {
    public class func objects<T: Object>(type: T.Type) -> Results<T>? {
        let realm = try? Realm()
        return realm?.objects(type)
    }
    
    public class func deleteAll() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.deleteAll()
        }
    }
}










