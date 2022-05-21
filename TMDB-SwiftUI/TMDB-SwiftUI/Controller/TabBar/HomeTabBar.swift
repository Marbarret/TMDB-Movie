//
//  HomeTabBar.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//
// https://github.com/onl1ner/TabBar

import SwiftUI

struct HomeTabBar: View {
    private var movieService: MovieServiceProtocol
    private var viewModel: HomeViewModel
    private var favoriteService: FavoriteServiceProtocol
    private var favoriteVM: FavoriteViewModel
    
    init() {
        self.movieService = MovieService(providerApi: ProviderMovieAPI())
        self.favoriteService = FavoriteService()
        self.viewModel = HomeViewModel(moviesService: movieService)
        self.favoriteVM = FavoriteViewModel(favoriteProtocol: favoriteService)
    }
    
    @State private var defaultView: Int = 0
    
    var body: some View {
        TabView(selection: $defaultView) {
            HomeView()
                .environmentObject(self.viewModel)
                .environmentObject(self.favoriteVM)
                .tabItem {
                    Label("titleMoviesKey", systemImage: "film")
                }
                .tag(0)
            FavoriteScreen()
                
                .environmentObject(self.favoriteVM)
                .background(Color.background)
                .tabItem {
                    Label("titleFavoriteKey", systemImage: "heart")
                }
                .tag(1)
        }
        .withDefaultTabBar(backgroundColor: Color.tab, selectItem: Color.icon)
    }
}

struct HomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
