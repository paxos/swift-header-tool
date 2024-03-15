// 
//  #####   #     #  ####### 
// #     #  #     #     #    
// #        #     #     #    
//  #####   #######     #    
//       #  #     #     #    
// #     #  #     #     #    
//  #####   #     #     #    
//                           
// Fixtures.swift
// Made by paxos in Mar 15, 2024

struct Fixtures {
  static let input1 = """
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
