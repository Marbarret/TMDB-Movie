//
//  MovieCell.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import SwiftUI

struct MovieCell: View {
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    var movie: MovieModel
    @State var isFavorite: Bool
    
    let title: String
    let poster: String?
    var path: String {
        return poster ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image("").imageMovie(path: "\(path)", width: 170, height: 250)
                
                VStack(alignment: .center) {
                    Text(title)
                        .titleMovie(font: .body)
                }
                .padding()
                .frame(width: 170, alignment: .leading)
                .background(Color.background.opacity(0.8))
                .cornerRadius(10)
            }
            .onAppear(perform: {
                isFavorite = favoriteVM.isFavoriteMovie(movie: movie)
            })
            
            .frame(width: 170, height: 250)
            .shadow(radius: 5, x: 0, y: 0)
            
            Button {
                if isFavorite {
                    favoriteVM.deleteFavorite(movie: movie)
                } else {
                    favoriteVM.saveFavorite(movie: movie)
                }
                favoriteVM.loadFavorite()
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .buttonFavoriteState(isFavorite: isFavorite)
            }
        }
    }
}
