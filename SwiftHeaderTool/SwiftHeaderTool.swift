// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// SwiftHeaderTool.swift
// Made by paxos in Mar 15, 2024

import Foundation
import ArgumentParser

@main
struct SwiftHeaderTool: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A utility for fixing your Swift file headers.",
        subcommands: [StripCommand.self, AddCommand.self, ReplaceCommand.self]
    )
}

