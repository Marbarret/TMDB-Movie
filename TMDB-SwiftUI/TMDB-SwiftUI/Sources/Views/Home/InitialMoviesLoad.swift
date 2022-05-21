//
//  InitialMoviesLoad.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import SwiftUI

struct InitialMoviesLoad: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    
    var body: some View {
        MovieList()
            .environmentObject(viewModel)
            .environmentObject(favoriteVM)
    }
}

struct InitialMoviesLoad_Previews: PreviewProvider {
    static var previews: some View {
        InitialMoviesLoad()
    }
}
