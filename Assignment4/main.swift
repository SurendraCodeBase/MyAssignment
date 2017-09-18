//
//  main.swift
//  Assignment4
//
//  Created by Surendra Singh on 9/16/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Foundation
import Cocoa

func main(){
    
    //Please change abosolute file as per your system. Since this target is command line
    let path = "/Users/Surendra/Desktop/AppleAssignment/Assignment4/4.strings"
    do {
        let input = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        var sum = 0
        print("\n*******************************RESULT*****************************************")
        
        for l in input.characters.split(separator: "\n"){
            let line = String(l)
            let sector = Sector(line)
            if(sector.valid){
                let decryptedMessage = sector.decrypt()
                if(decryptedMessage.contains("northpole")){
                    print("North Pole objects store room's Sector ID: \(sector.id)")
                    
                }
                sum += sector.id
            }
        }
        print("Real Room Sector ID's sunm: \(sum)")
        print("*******************************RESULT*****************************************\n")
        
    } catch let e {
        print("error : \(e.localizedDescription)")
    }
}

main()


