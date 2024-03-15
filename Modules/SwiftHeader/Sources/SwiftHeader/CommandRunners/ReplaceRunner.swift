//
//  File.swift
//  
//
//  Created by Patrick Dinger on 15.03.2024.
//

import Foundation

public struct ReplaceRunner {
    public static func run(path: String, templatePath: String) {
        CommentStripper.run(path: path)
        AddHeaderRunner.run(path: path, templatePath: templatePath)
    }
}
