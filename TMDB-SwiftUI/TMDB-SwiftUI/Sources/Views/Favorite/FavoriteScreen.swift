//
//  MovieScreen.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 03/05/22.
//

import SwiftUI

struct FavoriteScreen: View {
    @EnvironmentObject var favoriteVM: FavoriteViewModel
    
    var body: some View {
        FavoriteList()
            .background(Color.background)
            .environmentObject(favoriteVM)
            .onAppear {
                favoriteVM.loadFavorite()
            }
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
