// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// ReplaceCommand.swift
// Made by paxos in Mar 15, 2024

import ArgumentParser
import Foundation
import SwiftHeader

struct ReplaceCommand: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "replace", abstract: "Runs strip and add in one command")
    
    @Option(help: "Specify path to your project")
    public var path: String
    
    @Option(help: "Specify the template path to your project")
    public var templatePath: String
    
    public func run() throws {
        Replace.run(path: path, templatePath: templatePath)
    }
}
