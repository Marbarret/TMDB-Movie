//
//  FavoriteService.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import Foundation

protocol FavoriteServiceProtocol {
    var favoritesMovies: [MovieModel] {get set}
    func saveFavoriteMovie(movie: MovieModel)
    func getFavoriteMovies() -> [MovieModel]
    func deleteFavoriteMovie(movie: MovieModel)
    func isFavoriteMovie(movie: MovieModel) -> Bool
}

class FavoriteService: FavoriteServiceProtocol {
    
    let favoriteMoviesListKey = "favList"
    var favoritesMovies: [MovieModel] = []
    
    func saveFavoriteMovie(movie: MovieModel) {
        do{
            favoritesMovies.append(movie)
            let encoded = try JSONEncoder().encode(favoritesMovies)
            UserDefaultsUtils.save(value: encoded, key: favoriteMoviesListKey)
        }catch{
            
        }
    }
    
    func getFavoriteMovies() -> [MovieModel] {
        if let jsonObj = UserDefaultsUtils.get(key: favoriteMoviesListKey) as? Data {
            if let favorites = try? JSONDecoder().decode(Array.self, from: jsonObj) as [MovieModel] {
                favoritesMovies = favorites
                return favoritesMovies
            }
        }
        return []
    }

    func deleteFavoriteMovie(movie: MovieModel) {
        if let index = favoritesMovies.firstIndex(where: { $0.id == movie.id}){
            favoritesMovies.remove(at: index)
            do{
                let encoded = try JSONEncoder().encode(favoritesMovies)
                UserDefaultsUtils.save(value: encoded, key: favoriteMoviesListKey)
            }catch{
                
            }
        }
    }
    
    func isFavoriteMovie(movie: MovieModel) -> Bool {
        let movies = getFavoriteMovies()
        return !movies.filter { movieFav in
            movieFav == movie
        }
        .isEmpty
    }
    
    func reloadFavoriteMovie() {
        if let jsonObj = UserDefaultsUtils.get(key: favoriteMoviesListKey) as? Data,
           let favorites = try? JSONDecoder().decode(Array.self, from: jsonObj) as [MovieModel] {
            self.favoritesMovies = favorites
        }
    }
}
