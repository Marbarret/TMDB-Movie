//
//  MockContext.swift
//  TMDB-SwiftUI
//
//  Created by Marcylene Barreto on 27/04/22.
//

import Foundation

class MockContext {
    class func isRunningTests() -> Bool{
        return CommandLine.arguments.contains("--uitesting")
    }
}
