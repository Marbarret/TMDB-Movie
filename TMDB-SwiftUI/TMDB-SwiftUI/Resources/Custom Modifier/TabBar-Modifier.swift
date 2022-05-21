//
//  TabBarModifier.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
    let selectItem: Color
    
    init(background: UIColor, selectedItem: UIColor) {
        self.selectItem = Color(uiColor: selectedItem)
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = background
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = background
    }
    
    func body(content: Content) -> some View {
        content
            .accentColor(selectItem)
    }
}
