//
//  WebService.swift
//  MVVM
//
//  Created by MERCEDES on 07/09/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class WebService: NSObject {

    func fetchTracksFromiTunes(searchTerm : String = "jack johnson", for limit: Int = 25, complete : @escaping (_ items : ManagerOfTracks?, _ errorDesc : String?) -> Void){
        
        ManagerOfTracks.fetchTracks(searchTerm: searchTerm, for: limit) { (tracksManager, errorDesc) in
            DispatchQueue.main.async {
                complete(tracksManager, errorDesc)
            }
        }
    }
}
