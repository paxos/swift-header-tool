//
//  File.swift
//
//
//  Created by Patrick Dinger on 14.03.2024.
//

import ArgumentParser
import Foundation
import SwiftHeader

struct Strip: ParsableCommand {
    static var configuration
        = CommandConfiguration(abstract: "Some help for you!")

    @Option(help: "Specify path to your project")
    public var path: String

    public func run() throws {
        CommentStripper.run(path: path)
    }
}
