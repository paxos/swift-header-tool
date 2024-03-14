struct Fixtures {
  static let input1 = """
//
//  GraphQLClientError.swift
//
//
//  Created by Patrick Dinger on 3/25/22.
//

import MyPackage

struct SomeCode {
    func someFunc() {
        // Do not remove me
        let a = "hello how are you" // This is important
    }

    /// Also do not remove me
    /// or me
    ///

    /* This is some more comments
     Very important!
     */
    func someMoreStuff() {}
}

"""
    
  static let output1 = """

import MyPackage

struct SomeCode {
    func someFunc() {
        // Do not remove me
        let a = "hello how are you" // This is important
    }

    /// Also do not remove me
    /// or me
    ///

    /* This is some more comments
     Very important!
     */
    func someMoreStuff() {}
}

"""
}
