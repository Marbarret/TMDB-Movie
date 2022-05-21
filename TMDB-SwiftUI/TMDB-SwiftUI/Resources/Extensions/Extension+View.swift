//
//  Extension+View.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 01/05/22.
//

import SwiftUI

extension View {
    func imageMovie(path: String, width: CGFloat, height: CGFloat) -> some View {
        self.modifier(ImageLoad(path: path, width: width, height: height))
    }
    
    func titleMovie(font: Font) -> some View {
        self.modifier(TextModifier(font: font))
    }
    
    func navigationSettings(backgroundColor: Color, foregroundColor: Color) -> some View {
        self.modifier(NavigationModifier(backgroundColor: UIColor(backgroundColor), foregroundColor: UIColor(foregroundColor)))
    }
    
    func withDefaultTabBar(backgroundColor: Color, selectItem: Color) -> some View {
        modifier(TabBarModifier(background: UIColor(backgroundColor), selectedItem: UIColor(selectItem)))
    }
    
    func buttonFavoriteState(isFavorite: Bool) -> some View {
        self.modifier(ButtonState(isFavorite: isFavorite))
    }
}
