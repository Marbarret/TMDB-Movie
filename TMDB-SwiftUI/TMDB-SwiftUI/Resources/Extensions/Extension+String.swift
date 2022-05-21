//
//  Extension+String.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 29/04/22.
//

import Foundation

extension String {
    func formatterDate() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else {
            return nil
        }
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}
