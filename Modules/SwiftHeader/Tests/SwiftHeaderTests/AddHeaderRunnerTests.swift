// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// AddHeaderRunnerTests.swift
// Made by paxos in Mar 15, 2024

@testable import SwiftHeader
import XCTest

final class AddHeaderRunnerTests: XCTestCase {
    func testVariableReplacement() throws {
        let fixtureURL = Bundle.module.path(forResource: "fixtures/template1", ofType: "txt")!
        let input = try String(contentsOfFile: fixtureURL, encoding: .utf8)

        let fixtureOutputURL = Bundle.module.path(forResource: "fixtures/template1_output", ofType: "txt")!
        let output = try String(contentsOfFile: fixtureOutputURL, encoding: .utf8)

        XCTAssertEqual(output, Add.replaceTemplate(string: input, filename: "file.swift", date: Date(timeIntervalSince1970: 0)))
    }

    func testFilenameReplacement() throws {
        XCTAssertEqual(
            Add.replaceFilename(line: "This is $filename in this project", filename: "file.swift"),
            "This is file.swift in this project"
        )
    }

    func testReplaceFiglet() throws {
        let fixtureURL = Bundle.module.path(forResource: "fixtures/template2", ofType: "txt")!
        let input = try String(contentsOfFile: fixtureURL, encoding: .utf8)

        let fixtureOutputURL = Bundle.module.path(forResource: "fixtures/template2_output", ofType: "txt")!
        let output = try String(contentsOfFile: fixtureOutputURL, encoding: .utf8)

        XCTAssertEqual(
            Add.replaceFiglet(line: input),
            output
        )
    }
}
