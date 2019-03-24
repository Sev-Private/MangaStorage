//
//  Manga.swift
//  Manga Storage
//
//  Created by Thiago Augusto on 25/04/18.
//  Copyright © 2018 Thiago Augusto. All rights reserved.
//

import Foundation

struct Manga : Codable{
    var Title : String
    var Id : Int
    var Status : MangaStatus
    var Chapters: [MangaChapter]
    
}
