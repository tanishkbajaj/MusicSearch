//
//  ItunesConnection.swift
//  MusicSearch
//
//  Created by IMCS2 on 8/18/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class ItunesConnection: NSObject {
    
    class func getAlbumForString(searchString: String, completionHandler: @escaping (Album) -> ()){
        let escapedString = searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://itunes.apple.com/search?term=\(escapedString!)&media=music")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                if let unwrappedData = data {
                    do {
                        let itunesDict = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        let resultAlbum  = itunesDict?.object(forKey: "results") as! [Dictionary<String,AnyObject>]
                        
                        if let resultDict = resultAlbum.first {
                            let artist = resultDict["artistName"] as! String
                            let artWorkUrl = resultDict["artworkUrl100"] as! String
                            let albumTitle = resultDict["collectionName"] as! String
                            let genre = resultDict["primaryGenreName"] as! String
                            let album = Album(title: albumTitle, artist: artist, genre: genre, artWorkUrl: artWorkUrl)
                            completionHandler(album)
                        }
                        
                        
                        //  print(itunesDict)
                        
                    }catch {
                        print("error in fetching")
                        
                        
                    }
                }
            }
            
            
            
        }
        task.resume()
        
    }
}
