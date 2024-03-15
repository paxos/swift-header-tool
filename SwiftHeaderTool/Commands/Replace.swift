//
//  Replace.swift
//  SwiftHeaderTool
//
//  Created by Patrick Dinger on 15.03.2024.
//

import ArgumentParser
import Foundation
import SwiftHeader

struct Replace: ParsableCommand {
    @Option(help: "Specify path to your project")
    public var path: String
    
    @Option(help: "Specify the template path to your project")
    public var templatePath: String
    
    public func run() throws {
        ReplaceRunner.run(path: path, templatePath: templatePath)
    }
}
