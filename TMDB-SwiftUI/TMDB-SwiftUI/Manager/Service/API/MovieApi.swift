//
//  MovieApi.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation
import Moya

class ProviderMovieAPI {
    var providerApi: MoyaProvider<MovieApi>!
    init(isStub: Bool = false) {
        self.providerApi = isStub ? MoyaProvider<MovieApi>(stubClosure: MoyaProvider.immediatelyStub) : MoyaProvider<MovieApi>()
    }
}

enum MovieApi {
    case popularMovies(page: Int)
    case searchResultMovies(query: String)
}

extension MovieApi: TargetType {
    var apiKey: String {
        return "52db72946dc3afe5a87fe0ab69aec074"
    }
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        case .searchResultMovies:
            return "search/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popularMovies, .searchResultMovies:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .popularMovies:
            return BundleTests.loadJSONFromBundle(bundle: Bundle.main, resourceName: "MoviesMock")
        case .searchResultMovies:
            return Data()
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var parameters: [String : Any] {
        switch self {
        case .popularMovies(let page):
            var parameters = [String:Any]()
            parameters["api_key"] = apiKey
            parameters["page"] = "\(page)"
            return parameters
        case .searchResultMovies(let query):
            var parameters = [String:Any]()
            parameters["api_key"] = apiKey
            parameters["query"] = "\(query)"
            return parameters
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
