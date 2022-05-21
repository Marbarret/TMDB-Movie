//
//  MovieMock.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation

class BundleTests {
    static func loadJSONFromBundle(bundle: Bundle = Bundle.main, resourceName: String) -> Data {
        guard let url = bundle.url(forResource: resourceName, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
                  return Data()
              }
        return data
    }
}
