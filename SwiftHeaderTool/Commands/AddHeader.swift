//
//  AddHeader.swift
//  SwiftHeaderTool
//
//  Created by Patrick Dinger on 14.03.2024.
//

import ArgumentParser
import Foundation
import SwiftHeader

struct AddHeader: ParsableCommand {
    
    @Option(help: "Specify path to your project")
    public var path: String
    
    @Option(help: "Specify the template path to your project")
    public var templatePath: String
    
    public func run() throws {
        AddHeaderRunner.run(path: path, templatePath: templatePath)
    }
}
