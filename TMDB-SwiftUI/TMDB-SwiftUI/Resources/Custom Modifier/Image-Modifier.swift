//
//  ImageModifier.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 01/05/22.
//

import SwiftUI

struct ImageLoad: ViewModifier  {
    var path: String
    var width: CGFloat
    var height: CGFloat
    let imageApi = ImageApi()
    
    init(path: String, width: CGFloat, height: CGFloat) {
        self.path = path
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        AsyncImage(url: URL(string: "\(imageApi.baseURL)\(path)")) { load in
            switch load {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: self.width, height: self.height)
                    .scaledToFit()
            case .failure:
                Image("posterPlaceholder")
            default:
                EmptyView()
            }
        }
    }
}
