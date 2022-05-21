//
//  FavoriteView.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject private var viewModel: FavoriteViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies.indices, id: \.self) { moviesID in
                    let vm = viewModel.movies[moviesID]
                    let nextView = DetailView(movie: vm, isFavorite: true)
                        .background(Color.background)
                        .environmentObject(viewModel)
                        .navigationBarTitleDisplayMode(.inline)

                    NavigationLink(destination: nextView) {
                        FavoriteCell(movie: vm, imagePath: vm.posterPath ?? "", title: vm.title ?? "", releaseDate: vm.releaseDate ?? "")
                            .background(Color.background)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("titleFavoriteKey")
            .navigationSettings(backgroundColor: Color.tab, foregroundColor: Color.icon)
            
        }
    }
}
