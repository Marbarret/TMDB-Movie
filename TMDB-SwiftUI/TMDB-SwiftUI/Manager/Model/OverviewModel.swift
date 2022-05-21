//
//  OverviewModel.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation

class MoviesOverview: Decodable {
    let page: Int
    let results: [MovieModel]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(page: Int, results: [MovieModel], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
