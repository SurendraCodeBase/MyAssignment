//
//  main.swift
//  Assignment10
//
//  Created by Surendra Singh on 9/16/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Foundation
import Cocoa

extension String {
    public var lines : [String] {
        get {
            return self.components( separatedBy: "\n" ).map { $0.trimmingCharacters( in:.whitespaces ) }
        }
    }
}

func main() {
    
    //Please change abosolute file as per your system. Since this target is command line
    let path = "/Users/Surendra/Desktop/AppleAssignment/Assignment10/10.strings"
    do {
        let input = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let balanceBot = BalanceBot()
        let result = balanceBot.problem(input: input)
        print("\n*******************************RESULT*****************************************")
        print("Bot Number: \(result.0)")
        print("Multiply Value: \(result.1)")
        print("*******************************RESULT*****************************************\n")

    } catch let e {
        print("error : \(e.localizedDescription)")
    }
}

main()
