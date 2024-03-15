// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// AddCommand.swift
// Made by paxos in Mar 15, 2024

import ArgumentParser
import Foundation
import SwiftHeader

struct AddCommand: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "add", abstract: "Adds a new file header based on template")

    @Option(help: "Specify path to your project")
    public var path: String

    @Option(help: "Specify the template path to your project")
    public var templatePath: String

    public func run() throws {
        Add.run(path: path, templatePath: templatePath)
    }
}
