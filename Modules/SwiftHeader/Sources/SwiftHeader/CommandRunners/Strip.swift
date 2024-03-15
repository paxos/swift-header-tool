//
//  File.swift
//
//
//  Created by Patrick Dinger on 14.03.2024.
//

import Foundation

public struct Strip {
    public init() {}

    public static func run(path: String) {
        iterateSwiftFiles(in: path) { filename in
            applyToFile(from: filename)
        }
    }
    
    static func applyToFile(from filePath: String) {
        do {
            // Read the contents of the file
            let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)

            if let output = stripHeader(input: fileContents) {
                // Write the modified contents back to the file
                try output.write(toFile: filePath, atomically: true, encoding: .utf8)
                print("Comment headers removed from file: \(filePath)")
            }

        } catch {
            print("Error: \(error)")
        }
    }

    static func stripHeader(input fileContents: String) -> String? {
        do {
            let pattern =
                #"^\s*\/\/.*"# // Matches consecutive single-line (//) and block (/* */) comment lines

            let lines = fileContents.components(separatedBy: .newlines)
            var output: [String] = []

            let regex = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)

            var enteredHeaderArea = false
            var leftHeaderArea = false

            // If first line is not a comment, we shall not do more here
            guard lines.count > 0 && !lines[0].isEmpty else {
                return lines.joined(separator: "\n")
            }

            for line in lines {
                guard !leftHeaderArea else {
                    output.append(line)
                    continue
                }

                let isBlankLine = line.isEmpty
                let isComment = regex.matches(in: line, range: NSRange(location: 0, length: line.utf16.count)).count > 0
                if isComment {
                    enteredHeaderArea = isComment
                }

                if isBlankLine && enteredHeaderArea {
                    leftHeaderArea = true
                }

                if !isComment {
                    output.append(line)
                } else {
                    enteredHeaderArea = true
                }
            }

            return output.joined(separator: "\n")

        } catch {
            return nil
        }
    }


}
