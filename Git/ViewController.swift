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

protocol idSendDelegate{
    func idSend(id: String)
}

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var data : NSMutableArray = []
    var page : Int = 0;
    
    var delegate: idSendDelegate? = nil
    
    func add()
    {
        self.page += 1
        let tmdb = TMDBApi(api_key: API_KEY);
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
                self.table.reloadData()
            }
            else
            {
                for x in data.valueForKey("results") as! NSArray
                {
                    self.data.addObject(x)
                }
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
        cell?.setTitle(movie.getTitle())
        cell?.setRated(movie.getVoteAverage(), votes: movie.getVotes())
        cell?.poster?.sd_setImageWithURL(movie.getUrlPoster())
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let movie = MovieClass(movie: self.data.objectAtIndex(indexPath.row))
//        let present: UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Detail")
//        self.delegate?.idSend(movie.getID())
        
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        EventViewController *eventview = [sb instantiateViewControllerWithIdentifier:@"Event"];
//        eventview.idFacebook = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"id_facebook"];
//        eventview.nameEvent = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"name"];
//        eventview.imgEvent = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"link_img"];
//        [self.navigationController pushViewController:eventview animated:true];
        
        let sb: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let sv: DetailController = (sb.instantiateViewControllerWithIdentifier("Detail") as? DetailController)!
        sv.idSend(movie.getID())
        self.presentViewController(sv, animated: true,completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

