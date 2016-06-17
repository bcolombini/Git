//
//  DetailController.swift
//  Git
//
//  Created by Bruno Colombini on 14/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit
import AVFoundation
import Cosmos

class DetailController: UIViewController{
    
    var ID:String = ""
    @IBOutlet var poster : UIImageView?
    @IBOutlet var overview : UITextView?
    @IBOutlet var titulo : UILabel?
    @IBOutlet var star : CosmosView?

    @IBAction func backButton(sender : AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func playTrailer(sender: AnyObject)
    {
    
    }
    
    func idSend(id: String) {
        self.ID = id
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let TMDB = TMDBApi(api_key: API_KEY)
        TMDB.getMovie(self.ID)
        {
            (rs,er) in
            let movie = MovieClass(movie: rs)
            self.titulo?.text = movie.getTitle()
            self.titulo?.textColor = UIColor.whiteColor()
            self.overview?.text = movie.getOverview()
            self.poster?.sd_setImageWithURL(movie.getUrlPoster())
            self.star?.rating = 1
            self.star?.text = String(movie.getVoteAverage())+"/10"
            
        }
        // Do any additional setup after loading the view.
        
    
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
