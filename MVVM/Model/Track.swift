//
//  Track.swift
//  MVVM
//
//  Created by MERCEDES on 07/09/18.
//  Copyright © 2018 MERCEDES. All rights reserved.
//

import UIKit
import PromiseKit

struct ManagerOfTracks: Codable {
    var title :String = "Tracks"
    let resultCount :Int = 0
    var results :[Track] = [Track]()
    
    //This is usually synthesized, but we have to define it ourselves to exclude `title`
    private enum CodingKeys: String, CodingKey { case resultCount, results }

    // Create a Request with already gathered parameters
    static func makeRequest(searchTerm : String = "a", for limit: Int = 25) throws -> URLRequest {
        let newSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let urlString = "https://itunes.apple.com/search?term=" + newSearchTerm! + "&limit=" + limit.description
        let rq = URLRequest(url: URL.init(string: urlString)!)

//        rq.httpMethod = "POST"
//        rq.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        rq.addValue("application/json", forHTTPHeaderField: "Accept")
//        rq.httpBody = try JSONEncoder().encode(obj)
        return rq
    }
    
    static func fetchTracks(searchTerm : String = "a", for limit: Int = 25, complete : @escaping (_ items : ManagerOfTracks?, _ errorDesc : String?) -> Void){
        firstly {
            URLSession.shared.dataTask(.promise, with: try makeRequest(searchTerm: searchTerm, for: limit))
            }.map { response in
                try JSONDecoder().decode(ManagerOfTracks.self, from: response.data)
            }.done { manager in
                complete(manager, nil)
            }.catch { error in
                complete(nil, error.localizedDescription)
        }
    }
}

struct Track : Codable {
    
    let artistId : Int?
    let artistName : String?
    let artistViewUrl : String?
    let artworkUrl100 : String?
    let artworkUrl60 : String?
    let collectionCensoredName : String?
    let collectionExplicitness : String?
    let collectionId : Int?
    let collectionName : String?
    let collectionPrice : Float?
    let collectionViewUrl : String?
    let country : String?
    let currency : String?
    let discCount : Int?
    let discNumber : Int?
    let kind : String?
    let previewUrl : String?
    let primaryGenreName : String?
    let trackCensoredName : String?
    let trackCount : Int?
    let trackExplicitness : String?
    let trackId : Int?
    let trackName : String?
    let trackNumber : Int?
    let trackPrice : Float?
    let trackTimeMillis : Int?
    let trackViewUrl : String?
    let wrapperType : String?
    
    enum CodingKeys: String, CodingKey {
        case artistId = "artistId"
        case artistName = "artistName"
        case artistViewUrl = "artistViewUrl"
        case artworkUrl100 = "artworkUrl100"
        case artworkUrl60 = "artworkUrl60"
        case collectionCensoredName = "collectionCensoredName"
        case collectionExplicitness = "collectionExplicitness"
        case collectionId = "collectionId"
        case collectionName = "collectionName"
        case collectionPrice = "collectionPrice"
        case collectionViewUrl = "collectionViewUrl"
        case country = "country"
        case currency = "currency"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case kind = "kind"
        case previewUrl = "previewUrl"
        case primaryGenreName = "primaryGenreName"
        case trackCensoredName = "trackCensoredName"
        case trackCount = "trackCount"
        case trackExplicitness = "trackExplicitness"
        case trackId = "trackId"
        case trackName = "trackName"
        case trackNumber = "trackNumber"
        case trackPrice = "trackPrice"
        case trackTimeMillis = "trackTimeMillis"
        case trackViewUrl = "trackViewUrl"
        case wrapperType = "wrapperType"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        collectionPrice = try values.decodeIfPresent(Float.self, forKey: .collectionPrice)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
        discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
        trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
        trackPrice = try values.decodeIfPresent(Float.self, forKey: .trackPrice)
        trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
        trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
    }
    
}

/*
 Sample Response:::
{
    "wrapperType":"track",
    "kind":"song",
    "artistId":909253,
    "collectionId":120954021,
    "trackId":120954025,
    "artistName":"Jack Johnson",
    "collectionName":"Sing-a-Longs and Lullabies for the Film Curious George",
    "trackName":"Upside Down",
    "collectionCensoredName":"Sing-a-Longs and Lullabies for the Film Curious George",
    "trackCensoredName":"Upside Down",
    "artistViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=909253",
    "collectionViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&amp;id=120954021&amp;s=143441",
    "trackViewUrl":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&amp;id=120954021&amp;s=143441",
    "previewUrl":"http://a1099.itunes.apple.com/r10/Music/f9/54/43/mzi.gqvqlvcq.aac.p.m4p",
    "artworkUrl60":"http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.60x60-50.jpg",
    "artworkUrl100":"http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.100x100-75.jpg",
    "collectionPrice":10.99,
    "trackPrice":0.99,
    "collectionExplicitness":"notExplicit",
    "trackExplicitness":"notExplicit",
    "discCount":1,
    "discNumber":1,
    "trackCount":14,
    "trackNumber":1,
    "trackTimeMillis":210743,
    "country":"USA",
    "currency":"USD",
    "primaryGenreName":"Rock"
 }

*/
