//
//  ViewController.swift
//  MusicSearch
//
//  Created by IMCS2 on 8/18/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var searchTitleTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var numberOfItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageIndicator.numberOfPages = 0
        scrollView.delegate = self
        
        
    }

    @IBAction func searchMusic(_ sender: Any) {
        searchTitleTextField.resignFirstResponder()
        
        ItunesConnection.getAlbumForString(searchString: searchTitleTextField.text!, completionHandler: { (album: Album) -> () in
           // print(album.title)
            self.numberOfItems = self.numberOfItems + 1
            self.pageIndicator.numberOfPages = self.numberOfItems
            
            self.scrollView.contentSize = CGSize(width: CGFloat(self.numberOfItems) * self.scrollView.frame.size.width , height: self.scrollView.frame.height)
           // let we = UINib(nibName: "MusicView", bundle: nil) as! MusicView
            
             DispatchQueue.main.async {
                let musicDisplay = Bundle.main.loadNibNamed("MusicView", owner: self, options: nil)?.last as! MusicView
                
                musicDisplay.frame = CGRect(x: CGFloat(self.numberOfItems - 1) * self.scrollView.frame.size.width, y: 0, width: self.scrollView.frame.size.width , height: self.scrollView.frame.size.height)
                
                
                musicDisplay.addToMusicView(album: album)
                self.scrollView.addSubview(musicDisplay)
                self.scrollView.scrollRectToVisible(musicDisplay.frame, animated: true)
            }
            
            
        })
        
        
        
        
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = page
        
    }
    
}

