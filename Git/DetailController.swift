//
//  DetailController.swift
//  Git
//
//  Created by Bruno Colombini on 14/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit
import AVFoundation

class DetailController: UIViewController{
    
    var ID:String = ""
    
    func idSend(id: String) {
        self.ID = id
    }
    
    @IBAction func voltarItemBar(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let movie = TMDBApi(api_key: API_KEY)
        movie.getMovie(self.ID)
        {
            (rs,er) in
            print(rs)
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
