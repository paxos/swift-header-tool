// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// Replace.swift
// Made by paxos in Mar 15, 2024

import Foundation

public struct Replace {
    public static func run(path: String, templatePath: String) {
        Strip.run(path: path)
        Add.run(path: path, templatePath: templatePath)
    }
}
