//
//  DetailController.swift
//  Git
//
//  Created by Bruno Colombini on 14/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//

import UIKit


class DetailController: UIViewController,idSendDelegate {
    
    func idSend(id: String) {
        print(id)
    }
    
    @IBAction func voltarItemBar(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc : ViewController = ViewController();
        vc.delegate = self
        
        
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
