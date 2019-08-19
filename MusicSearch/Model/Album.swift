//
//  Album.swift
//  MusicSearch
//
//  Created by IMCS2 on 8/18/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    var title: String!
    var artist: String!
    var genre: String!
    var artWorkUrl: String!
    
    init(title: String, artist: String, genre: String, artWorkUrl: String) {
        super.init()
        
        self.title = title
        self.artist = artist
        self.genre = genre
        self.artWorkUrl = artWorkUrl
        
    }

}
