//
//  FavoriteList.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 03/05/22.
//

import SwiftUI

struct FavoriteList: View {
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    
    var body: some View {
        FavoriteView()
            .environmentObject(favoriteVM)
    }
}

struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
