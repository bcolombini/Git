//
//  TMDBApi.swift
//  Git
//
//  Created by Bruno Colombini on 11/06/16.
//  Copyright © 2016 Bruno Colombini. All rights reserved.
//
//  Desenvolvido para aprofundamento em swift e portifolio
import UIKit
import Alamofire
import SwiftyJSON

class TMDBApi: NSObject {
    
    //API_KEY FROM THEMOVIEDB.ORG
    private var params: [String: AnyObject]
    private var results = [AnyObject]()

    
    
    init(api_key: String?)
    {
        self.params = ["api_key":api_key!]
    
    }
    
    //Retona os filmes mais votados
    //Params: Page: String escolhe a pagina a retornar
    //Exemplo: (self.getMovieRated(1){
    //    data,er in
    //        print(data)
    // })
    func getMovieRated(page: Int = 1,complete:(retorno: AnyObject,error: NSError?)->Void)
    {
        if page != 1{
            self.params["page"] = page;
        }
        
        self.request("movie/top_rated")
        {
        (rs,er) in
            if er != nil{
                    return
            }
            complete(retorno: rs!,error: nil)
        
        }
    }
    
    func request(r: String,complete:(resultado:AnyObject? ,error : NSError?) -> Void)
    {
        Alamofire.request(.GET,"http://api.themoviedb.org/3/"+r,parameters:self.params).responseJSON{
            response in
            complete(resultado:response.result.value,error: nil)
        }
        
    }
    
    
    
}
