//
//  ButtonState.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 04/05/22.
//

import SwiftUI

struct ButtonState: ViewModifier {
    let isFavorite: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(5)
            .foregroundColor(.red)
            .background(.black)
            .cornerRadius(50)
            .padding()
    }
}
