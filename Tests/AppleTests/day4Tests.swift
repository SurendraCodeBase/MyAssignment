//
//  day4Tests.swift
//  Apple
//
//  Created by Surendra Singh on 10/5/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Quick
import Nimble

@testable import Apple

class day4Tests: QuickSpec {
    override func spec() {
        
        let instructions = try! String(contentsOfFile: "./Tests/AppleTests/day4.txt")
        
        
        describe("DAY - 4: aaaaa-bbb-z-y-x-123[abxyz] is a real room") {
            it("aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically") {
                    let sector = Sector("aaaaa-bbb-z-y-x-123[abxyz]")
                    expect(sector.valid) == true
            }
        }
        describe("DAY - 4: a-b-c-d-e-f-g-h-987[abcde] is a real room") {
            it("a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are listed alphabetically.") {
                    let sector = Sector("a-b-c-d-e-f-g-h-987[abcde]")
                    expect(sector.valid) == true
            }
        }
        
        describe("DAY - 4: not-a-real-room-404[oarel] is a real room.") {
                it("not-a-real-room-404[oarel] is a real room.") {
                    let sector = Sector("not-a-real-room-404[oarel]")
                    expect(sector.valid) == true
            }
        }
        
        describe("DAY - 4: totally-real-room-200[decoy] is not a real room.") {
                it("totally-real-room-200[decoy] is not a real room.") {
                    let sector = Sector("totally-real-room-200[decoy]")
                    expect(sector.valid) == false
                }
            
        }
        
        describe("DAY - 4: Part 1 - Read input instructions") {
                it("Your puzzle answer was 137896.") {
                    var sum = 0
                    for l in instructions.characters.split(separator: "\n"){
                        let line = String(l)
                        let sector = Sector(line)
                        if(sector.valid){
                            sum += sector.id
                        }
                    }
                    expect(sum) == 137896
                }
        }
        
        describe("DAY - 4: Part 2 - Read input instructions") {
                it("Your puzzle answer was 501") {
                    for l in instructions.characters.split(separator: "\n"){
                        let line = String(l)
                        let sector = Sector(line)
                        if(sector.valid){
                            let decryptedMessage = sector.decrypt()
                            if(decryptedMessage.contains("northpole")){
                                expect(sector.id) == 501
                            }
                        }
                    }
                
            }
        }
    }
}
