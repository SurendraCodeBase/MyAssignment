//
//  Direction.swift
//  AppleAssignment
//
//  Created by Surendra Singh on 9/15/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

struct Direction{
    let direction: String
    let value: Int
    
    init(valueString: String) {
        //Get Char array from Direction
        let valueArray = Array(valueString.characters)
        var directionIndex = 0
        
        //Check Space
        while(valueArray[directionIndex] == " "){
            directionIndex += 1
        }
        //Convert char to string and get first char from Direction
        direction = String(valueArray[directionIndex])
        
        let index = valueString.index(valueString.startIndex, offsetBy: directionIndex + 1 )
        //turn no
        value = Int(valueString.substring(from: index)) ?? 0
    }
}
