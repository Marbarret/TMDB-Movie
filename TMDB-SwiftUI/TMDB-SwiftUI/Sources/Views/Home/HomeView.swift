//
//  HomeView.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            Text("Nao há filme")
                .task {
                    await self.viewModel.fetchMovies(page: 1)
                }
        case .loading:
            Text("Carregando")
        case .loaded:
            if viewModel.hasMovies() {
                InitialMoviesLoad()
                    .environmentObject(viewModel)
                    .environmentObject(favoriteVM)
            } else {
                Text("Nao há filme")
            }
        case .failed(let err):
            Text("\(err.localizedDescription)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
