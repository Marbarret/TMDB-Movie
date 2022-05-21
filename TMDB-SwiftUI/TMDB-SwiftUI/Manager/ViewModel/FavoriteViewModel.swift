//
//  FavoriteViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import Foundation
import SwiftUI

class FavoriteViewModel: ObservableObject {
    
    @Published private(set) var movies: [MovieModel] = []
    var favoriteService: FavoriteServiceProtocol
    
    init(favoriteProtocol: FavoriteServiceProtocol) {
        self.favoriteService = favoriteProtocol
    }
    
    func loadFavorite() {
        movies = favoriteService.getFavoriteMovies()
    }
    
    func saveFavorite(movie: MovieModel) {
        favoriteService.saveFavoriteMovie(movie: movie)
    }
    
    func deleteFavorite(movie: MovieModel) {
        favoriteService.deleteFavoriteMovie(movie: movie)
    }
    
    func isFavoriteMovie(movie: MovieModel) -> Bool {
        return favoriteService.isFavoriteMovie(movie: movie)
    }
}
