// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// Utils.swift
// Made by paxos in Mar 15, 2024

import Foundation
import SwiftFigletKit

public extension SFKFigletFile {
    static func from(raw text: String) -> SFKFigletFile? {
        // Terrible workaround to avoid forking
        let tempDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        let tempFileURL = tempDirectoryURL.appendingPathComponent("figlet.txt")
        do {
            try text.write(toFile: tempFileURL.path, atomically: true, encoding: .ascii)
        } catch {
            return nil
        }
        return SFKFigletFile.from(url: tempFileURL)
    }
}

func iterateSwiftFiles(in folderPath: String, callback: (String) -> Void) {
    do {
        // Get all files and directories in the specified directory
        let fileManager = FileManager.default
        let contents = try fileManager.contentsOfDirectory(atPath: folderPath)

        // Filter out only Swift files
        let swiftFiles = contents.filter { $0.hasSuffix(".swift") }

        // Iterate over Swift files and remove comment headers
        for file in swiftFiles {
            let filePath = "\(folderPath)/\(file)"

            if let lastPathComponent = URL(string: file)?.lastPathComponent.lowercased() {
                guard
                    lastPathComponent != "package.swift" && lastPathComponent != ".git"
                else {
                    continue
                }
            }

            callback(filePath)
        }

        // Recursively iterate over subfolders
        for item in contents {
            let subfolderPath = "\(folderPath)/\(item)"
            var isDirectory: ObjCBool = false
            if fileManager.fileExists(atPath: subfolderPath, isDirectory: &isDirectory) && isDirectory.boolValue {
                // If it's a directory, call iterateSwiftFiles recursively
                iterateSwiftFiles(in: subfolderPath, callback: callback)
            }
        }
    } catch {
        print("Error: \(error)")
    }
}

func makeFiglet(input string: String, usingFont font: SFKFont) -> String? {
    guard font.height > 0 else { return nil }
    var result = [""]

    for i in 0 ... font.height - 1 {
        var line = ""
        for c in string {
            if let fontCharacter = font.fkChar[c],
               i < fontCharacter.lines.count
            {
                line.append(fontCharacter.lines[i])
            } else {
                // Swift.print("\(c)")
            }
        }
        result.append(line)
    }

    return result.joined(separator: "\n")
}
