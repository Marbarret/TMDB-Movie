//
//  MovieService.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation

protocol MovieServiceProtocol {
    func searchMovie(with query: String) async throws -> [MovieModel]
    func getPopularMovies(page: Int) async throws -> [MovieModel]
}

class MovieService: MovieServiceProtocol {
    var provider: ProviderMovieAPI
    
    init(providerApi: ProviderMovieAPI){
        self.provider = providerApi
    }
    
    func getPopularMovies(page: Int) async throws -> [MovieModel] {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<[MovieModel], Error>) in
            provider.providerApi.request(.popularMovies(page: page)) { result in
                switch result {
                case .success(let response):
                    let movie = try! JSONDecoder().decode(MoviesOverview.self, from: response.data)
                    let result = movie.results
                    continuation.resume(returning: result)
                    break
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    func searchMovie(with query: String) async throws -> [MovieModel] {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<[MovieModel], Error>) in
            provider.providerApi.request(.searchResultMovies(query: query)) { result in
                switch result {
                case .success(let response):
                    do {
                        let movies = try JSONDecoder().decode(MoviesOverview.self, from: response.data)
                        let resultSearch = movies.results
                        continuation.resume(returning: resultSearch)
                    } catch let err {
                        print(err)
                    }
                    break
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
}
