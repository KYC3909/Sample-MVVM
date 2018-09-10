//
//  TrackListViewController.swift
//  MVVM
//
//  Created by MERCEDES on 07/09/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit

class TrackListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel :TrackListViewModel = TrackListViewModel()
    
    override func viewDidLoad() { super.viewDidLoad()
        self.title = self.viewModel.title
        loadTracks()
    }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    private func loadTracks() {
        
        // This web service is listing Tracks from iTunes Music.
        // I need to focus only on Sample MVVM Structure.
        // This web service is using Sample usage of Promise Kit.
        WebService().fetchTracksFromiTunes() { tracksManager,errorDesc  in
            
            let tracksViewModels = tracksManager?.results.compactMap { track in
                return TrackViewModel(track :track)
            }
            self.viewModel.tracksManager = tracksManager
            self.viewModel.trackViewModels = tracksViewModels ?? []
            self.tableView.reloadData()
        }
    }

}

extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.trackViewModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackTableViewCell
        
        // This TrackViewModel is Displaying data to Cell
        let trackViewModel = self.viewModel.trackViewModels[0]
        cell.configureCell(for: trackViewModel)
        
        return cell
    }
}

extension TrackListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - TrackTableViewCell Class-
class TrackTableViewCell: UITableViewCell {
    override func awakeFromNib() { super.awakeFromNib()
        selectionStyle = .none
    }
    func configureCell(for trackViewModel: TrackViewModel){
        if let textLbl = self.viewWithTag(1) as? UILabel{
            textLbl.text = trackViewModel.title
        }
        if let textDetailLbl = self.viewWithTag(2) as? UILabel{
            textDetailLbl.text = trackViewModel.description
        }
    }
}
