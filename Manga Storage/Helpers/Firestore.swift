//
//  Firestore.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 25/04/18.
//  Copyright © 2018 Thiago Augusto. All rights reserved.
//

import Foundation
import Firebase

class MangaStorage{
    static var sharedInstance = MangaStorage()
    
    private init(){
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        firestore = Firestore.firestore()
        firestore.settings = settings
    }
    
    private (set) var firestore : Firestore
    
    struct Collections{
        static let Manga = "Manga"
    }
}
