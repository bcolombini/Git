//
//  MovieClass.swift
//  Git
//
//  Created by Bruno Colombini on 14/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit

class MovieClass: NSObject {
    
    private var movie : AnyObject
    
    init(movie: AnyObject)
    {
        self.movie = movie
        
    }

    func getTitle() -> String
    {
        return self.movie.valueForKey("title")! as! String
    }
    
    func getVoteAverage() -> String
    {
        return String(self.movie.valueForKey("vote_average")!)
    }
    
    func getUrlPoster() -> NSURL
    {
        let url = "http://image.tmdb.org/t/p/w500/"+String(self.movie.valueForKey("poster_path")!)
        let return_url = NSURL(string: url)
        return return_url!
    }
    
    func getID() -> String
    {
        return String(self.movie.valueForKey("id")!)
    }
}
