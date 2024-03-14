//
//  File.swift
//
//
//  Created by Patrick Dinger on 14.03.2024.
//

import Foundation
import SwiftFigletKit

public enum AddHeaderRunner {
    public static func run(path: String, templatePath: String) {
        iterateSwiftFiles(in: path) { filename in

            guard let template = try? String(contentsOfFile: templatePath) else {
                print("Template \(templatePath) not found")
                return
            }

            guard let fileContent = try? String(contentsOfFile: filename) else {
                print("File \(filename) not found")
                return
            }

            let header = replaceTemplate(string: template, filename: filename)
            let output = header + "\n\n" + fileContent
            do {
                try output.write(toFile: filename, atomically: true, encoding: .utf8)
            } catch {
                print("Could not write \(filename)")
            }
        }
    }

    public static func replaceTemplate(string: String, filename: String, date: Date = Date()) -> String {
        var output: [String] = []
        for line in string.components(separatedBy: .newlines) {
            let updatedLine = replaceDate(
                line: replaceFiglet(line: replaceFilename(line: line, filename: filename)),
                date: date
            )

            // Adds comments to Figlets
            if !updatedLine.isEmpty {
                output.append("// " + updatedLine)
            }
        }
        return output.joined(separator: "\n")
    }

    static func replaceDate(line: String, date: Date) -> String {
        let pattern = #"\$date"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: line.utf16.count)

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none

        return regex.stringByReplacingMatches(in: line, range: range, withTemplate: formatter.string(from: date))
    }

    static func replaceFilename(line: String, filename: String) -> String {
        let pattern = #"\$filename"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: line.utf16.count)

        guard let url = URL(string: filename) else {
            print("Failed to parse \(filename)")
            return ""
        }

        return regex.stringByReplacingMatches(in: line, range: range, withTemplate: url.lastPathComponent)
    }

    static func replaceFiglet(line inputString: String) -> String {
        let pattern = "\\$figlet\\(([^)]+)\\)"
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: inputString.utf16.count)
        let nsRange = NSRange(inputString.startIndex ..< inputString.endIndex, in: inputString)

        // Find matches
        if let match = regex.firstMatch(in: inputString, options: [], range: range) {
            // Extract the captured group
            let templateRange = match.range(at: 1) // '1' corresponds to the first capture group
            if templateRange.location != NSNotFound, let range = Range(templateRange, in: inputString) {
                let template = inputString[range] // This is your variable 'Template1'
//                print("Template: \(template)") // Prints: Template: Template1

                // Replace $figlet(Template1) with something else, e.g., just 'Template1' for demonstration

//                let fontURL = SwiftFigletKit.bundle
                let b = BannerFont
                let font = SFKFont.from(file: SFKFigletFile.from(raw: BannerFont)!)!

//                let a = Bundle.module.url(forResource: "fonts/Banner", withExtension: "flf")!
//                let font = SFKFont.from(ra
                let figlet = makeFiglet(input: String(template), usingFont: font)!

                let modifiedString = regex.stringByReplacingMatches(
                    in: inputString,
                    options: [],
                    range: nsRange,
                    withTemplate: figlet
                )

                let commentedString = modifiedString.components(separatedBy: .newlines).map { $0.isEmpty
                    ? $0
                    : "//\($0)"
                }
                return commentedString.joined(separator: "\n")
            }
        }

        return inputString
    }
}
