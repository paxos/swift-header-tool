//
//  File.swift
//
//
//  Created by Patrick Dinger on 14.03.2024.
//

import ArgumentParser
import Foundation
import SwiftHeader

struct StripCommand: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "strip", abstract: "Remove file header")

    @Option(help: "Specify path to your project")
    public var path: String

    public func run() throws {
        Strip.run(path: path)
    }
}
