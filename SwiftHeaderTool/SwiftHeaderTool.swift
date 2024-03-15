//
//  main.swift
//  SwiftHeaderTool
//
//  Created by Patrick Dinger on 14.03.2024.
//

import Foundation
import ArgumentParser

@main
struct SwiftHeaderTool: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A utility for fixing your file headers.",
        subcommands: [Strip.self, AddHeader.self, Replace.self]
    )
}

