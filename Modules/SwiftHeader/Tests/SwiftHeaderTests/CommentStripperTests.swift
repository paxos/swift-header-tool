// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// CommentStripperTests.swift
// Made by paxos in Mar 15, 2024

@testable import SwiftHeader
import XCTest

final class SwiftHeaderTests: XCTestCase {
    func testExample() throws {
        let input = Strip.stripHeader(input: Fixtures.input1)!
        XCTAssertEqual(Fixtures.output1, input)
    }
}
