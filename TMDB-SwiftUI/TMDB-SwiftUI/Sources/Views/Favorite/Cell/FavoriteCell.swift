//
//  FavoriteCell.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import SwiftUI

struct FavoriteCell: View {
    
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    var movie: MovieModel
    @State var isFavorite = true
    
    let imagePath: String
    let title: String
    let releaseDate: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image("").imageMovie(path: "\(imagePath)", width: 90, height: 130)
                .cornerRadius(10)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .foregroundColor(Color.icon)
                    .font(.system(size: 17))
                    .bold()
                    .lineLimit(2)
                
                Text(movie.releaseDate?.formatterDate() ?? "")
                    .font(.footnote)
                    .foregroundColor(Color.icon)
                    .lineLimit(1)
            }
            .padding()
            Spacer()
            // Button Favorite Movie
            Button {
                if isFavorite {
                    favoriteVM.deleteFavorite(movie: movie)
                    favoriteVM.loadFavorite()
                }
                favoriteVM.loadFavorite()
            } label: {
                Image(systemName: "heart.fill")
                .foregroundColor(.red)
            }
        }
        .frame(width: .infinity, height: .infinity)
        .padding()
        .background(Color.tab)
        .cornerRadius(10)
        .padding()
    }
}
