//
//  TextModifier.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 02/05/22.
//

import SwiftUI

struct TextModifier: ViewModifier {
    let font: Font
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .lineLimit(2)
            .foregroundColor(Color.white)
    }
}
