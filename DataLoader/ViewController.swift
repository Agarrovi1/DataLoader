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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        service = SPTDataLoaderService.init(userAgent: nil, rateLimiter: nil, resolver: nil, customURLProtocolClasses: nil)
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/lucario")!
        
        sptRequest = SPTDataLoaderRequest.init(url: url, sourceIdentifier: nil)
        
        factory = service.createDataLoaderFactory(with: nil)
        
        loader = factory.createDataLoader()
        
        loader.delegate = self
        
        loader.perform(sptRequest)
        
    }


}

extension ViewController: SPTDataLoaderDelegate {
    func dataLoader(_ dataLoader: SPTDataLoader, didReceiveSuccessfulResponse response: SPTDataLoaderResponse) {

        let json = String(data: response.body ?? Data(), encoding: .utf8)
        print(json)
        
    }
    
    func dataLoader(_ dataLoader: SPTDataLoader, didReceiveErrorResponse response: SPTDataLoaderResponse) {
        print(response.body)
        
    }
    
    
}
