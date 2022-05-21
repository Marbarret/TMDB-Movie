//
//  DetailView.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var favoriteVM: FavoriteViewModel
    var movie: MovieModel
    @State var isFavorite: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image("").imageMovie(path: "\(movie.posterPath ?? "")", width: 180, height: 250)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
            }
            .padding(.top, 60)
            
            VStack {
                // Title Movie
                VStack(spacing: 15) {
                    Text(movie.title ?? "")
                        .titleMovie(font: .title2)
                    
                    // Details movie
                    HStack(spacing: 20) {
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.caption)
                            Text("\(movie.voteAverage ?? 0)")
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(movie.releaseDate?.formatterDate() ?? "")
                        }
                    }
                    .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding()
            .foregroundColor(Color.white.opacity(0.5))
            
            ScrollView {
                // Overview
                Text(movie.overview ?? "")
                    .font(.body)
                    .foregroundColor(Color.white)
                    .padding()
                
            }
            
        }
        .onAppear(perform: {
            isFavorite = favoriteVM.isFavoriteMovie(movie: movie)
        })
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("movieDetailKey")
        .navigationSettings(backgroundColor: Color.tab, foregroundColor: Color.white)
        .background(Color.background)
        .toolbar {
            Button {
                if isFavorite {
                    
                    favoriteVM.deleteFavorite(movie: movie)
                } else {
                    
                    favoriteVM.saveFavorite(movie: movie)
                }
                favoriteVM.loadFavorite()
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart").foregroundColor(.red)
            }

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("movie")
    }
}
