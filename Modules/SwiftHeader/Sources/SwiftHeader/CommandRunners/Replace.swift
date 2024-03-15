//
//  File.swift
//  
//
//  Created by Patrick Dinger on 15.03.2024.
//

import Foundation

public struct Replace {
    public static func run(path: String, templatePath: String) {
        Strip.run(path: path)
        Add.run(path: path, templatePath: templatePath)
    }
}
