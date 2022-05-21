//
//  NavigationModifier.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 02/05/22.
//

import SwiftUI

struct NavigationModifier: ViewModifier {
    
    init(backgroundColor: UIColor, foregroundColor: UIColor) {
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navAppearance.backgroundColor = backgroundColor
        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().tintColor = UIColor(Color.icon)
    }
    
    func body(content: Content) -> some View {
        content
    }
}
