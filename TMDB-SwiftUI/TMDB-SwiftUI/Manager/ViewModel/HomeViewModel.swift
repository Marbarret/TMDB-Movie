//
//  HomeViewModel.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//
// https://api.themoviedb.org/3/movie/550?api_key=32494d84efefe3626c48d385206f1b81

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var serviceMovie: MovieServiceProtocol
    
    private (set)var movies: [MovieModel] = []
    
    @Published private(set) var state = LoadingState.idle
    
    init(moviesService: MovieServiceProtocol) {
        self.serviceMovie = moviesService
    }
    
    func fetchMovies(page: Int) async {
        self.state = .loading
        do {
            self.movies = try await serviceMovie.getPopularMovies(page: page)
            
            DispatchQueue.main.async {
                self.state = .loaded
            }
        } catch let error {
            self.movies = []
            self.state = .failed(error)
        }
    }
    
    func searchMovie(query: String) async {
        self.state = .loading
        do {
            self.movies = try! await serviceMovie.searchMovie(with: query)
            DispatchQueue.main.async {
                self.state = .loaded
            }
        } catch let err {
            self.movies = []
            self.state = .failed(err)
        }
    }
    
    func hasMovies() -> Bool {
        return !movies.isEmpty
    }
}
