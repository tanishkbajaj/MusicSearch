//
//  MusicView.swift
//  MusicSearch
//
//  Created by IMCS2 on 8/19/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class MusicView: UIView {

    @IBOutlet weak var ArtWorkImageView: UIImageView!
    
    @IBOutlet weak var Titlelabel: UILabel!
    
    @IBOutlet weak var artistlabel: UILabel!
    
    @IBOutlet weak var genrelabel: UILabel!
    
    func addToMusicView(album: Album) {
        
        ArtWorkImageView.image = UIImage(data: NSData(contentsOf: NSURL(string: album.artWorkUrl)! as URL)! as Data)
        
        Titlelabel.text = album.title
        artistlabel.text = album.artist
        
        genrelabel.text = album.genre
        
    }
    
}
