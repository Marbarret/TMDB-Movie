//
//  ImageApi.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation
import Moya

class ImageApi {
    var baseURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/")!
    }
}
