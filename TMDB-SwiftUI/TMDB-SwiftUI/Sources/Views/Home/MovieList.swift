//
//  MovieList.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import SwiftUI

struct MovieList: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    
    private let gridMovies = [GridItem(.flexible()), GridItem(.flexible())]
    private let gridSearch = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {                
                LazyVGrid(columns: gridMovies, spacing: 20) {
                    ForEach(viewModel.movies.indices, id: \.self) { movieID in
                        let vm = viewModel.movies[movieID]
                        let isFavorite = favoriteVM.isFavoriteMovie(movie: vm)
                        let detail = DetailView(movie: vm, isFavorite: isFavorite)
                            .background(Color.background)
                            .environmentObject(favoriteVM)
                        
                        NavigationLink(destination: detail) {
                            MovieCell(movie: vm, isFavorite: isFavorite, title: vm.title!, poster: vm.posterPath)
                                .background(Color.background)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("titleMoviesKey")
            .navigationSettings(backgroundColor: Color.tab, foregroundColor: Color.white)
            .background(Color.background)
            
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
