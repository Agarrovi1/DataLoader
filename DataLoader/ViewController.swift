//
//  ViewController.swift
//  DataLoader
//
//  Created by Angela Garrovillas on 4/13/21.
//  Copyright © 2021 Angela Garrovillas. All rights reserved.
//

import UIKit
import SPTDataLoader

var service = SPTDataLoaderService.init()
var sptRequest = SPTDataLoaderRequest.init()
var loader = SPTDataLoader.init()
var factory = SPTDataLoaderFactory()


class ViewController: UIViewController {
    
    
//    var rateLimiter = SPTDataLoaderRateLimiter.init()
//    var resolver = SPTDataLoaderResolver.init()
//    var service = SPTDataLoaderService.init()
//    var sptRequest = SPTDataLoaderRequest.init()
//    var response = SPTDataLoaderResponse.init()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //service = SPTDataLoaderService.init(userAgent: "Spotify-Demo", rateLimiter: rateLimiter, resolver: resolver, customURLProtocolClasses: nil)
        

        
        service = SPTDataLoaderService.init(userAgent: nil, rateLimiter: nil, resolver: nil, customURLProtocolClasses: nil)
        
            
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        
        
        sptRequest = SPTDataLoaderRequest.init(url: url, sourceIdentifier: nil)
        
        //var authoriser = SPTDataLoaderAuthoriser()
        
        factory = service.createDataLoaderFactory(with: nil)
        
        loader = factory.createDataLoader()
        
        loader.delegate = self
        
        loader.perform(sptRequest)
        
    }


}

extension ViewController: SPTDataLoaderDelegate {
    func dataLoader(_ dataLoader: SPTDataLoader, didReceiveSuccessfulResponse response: SPTDataLoaderResponse) {
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            if let _ = error {
//                errorHandler(AppError.badStatusCode)
//            }
//            print("bad status code")
//            return
//        }
        //print(response)
        let json = String(data: response.body ?? Data(), encoding: .utf8)
        print(json)
        
        //print(response.body)
        //print("received successful response")
        
    }
    
    func dataLoader(_ dataLoader: SPTDataLoader, didReceiveErrorResponse response: SPTDataLoaderResponse) {
        print(response.body)
        //print("received error response")
    }
    
    
}
