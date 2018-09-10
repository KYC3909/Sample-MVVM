//
//  TrackDetailsViewController.swift
//  MVVM
//
//  Created by MERCEDES on 07/09/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    override func viewDidLoad() { super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
    }
}
