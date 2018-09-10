//
//  TrackListViewModel.swift
//  MVVM
//
//  Created by MERCEDES on 07/09/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class TrackListViewModel {
    var title :String = "Tracks"
    var trackViewModels :[TrackViewModel] = [TrackViewModel]()
    var tracksManager :ManagerOfTracks? = nil
    
    init() {
    }
}



struct TrackViewModel {
    
    var title :String
    var description :String
}

extension TrackViewModel {
    
    init(track :Track) {
        self.title = track.collectionName ?? ""
        self.description = track.wrapperType ?? ""
    }
}
