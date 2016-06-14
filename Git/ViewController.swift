//
//  ViewController.swift
//  Git
//
//  Created by Bruno Colombini on 02/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON
import UIScrollView_InfiniteScroll

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var data : NSMutableArray = []
    var page : Int = 0;
    func add()
    {
        self.page += 1
        let tmdb = TMDBApi(api_key: "978936c5482bb85e744bd805dad57ba9");
        tmdb.getMovieRated(self.page){
            (data,error) in
            if error != nil{
                return
            }
            //            print(data.valueForKey("results")!)
            if self.page == 1{
                for x in data.valueForKey("results") as! NSArray
                {
                    self.data.addObject(x)
                }
                print(self.data)
                self.table.reloadData()
            }
            else
            {
                for x in data.valueForKey("results") as! NSArray
                {
                    self.data.addObject(x)
                }
                self.table.reloadData()
                print(self.data)
                print(self.data.count)
                self.table.reloadData()
                self.table.finishInfiniteScroll()
            }
        
        };
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.add();
        self.table.infiniteScrollIndicatorStyle = .Gray
        table.addInfiniteScrollWithHandler{(scrollView) -> Void
        in
        self.add()
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.data.count != 0
        {
            return self.data.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Celula", forIndexPath: indexPath) as?TableViewCell
        let movie = MovieClass(movie: self.data.objectAtIndex(indexPath.row))

        cell?.titulo?.text = movie.getTitle()
        cell?.pontuacao?.text = movie.getVoteAverage()
        cell?.poster?.sd_setImageWithURL(movie.getUrlPoster())
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = MovieClass(movie: self.data.objectAtIndex(indexPath.row))
        self.presentViewController(self.storyboard!.instantiateViewControllerWithIdentifier("Detail") as UIViewController, animated: true,completion: nil)
        print(movie.getID())
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

