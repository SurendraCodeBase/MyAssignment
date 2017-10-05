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
        
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "day4", ofType: "txt")!
        let instructions =  try! String(contentsOfFile:path)
        
        describe("Security Through Obscurity") {
            describe("aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically") {
                it("aaaaa-bbb-z-y-x-123[abxyz] is a real room") {
                    let sector = Sector("aaaaa-bbb-z-y-x-123[abxyz]")
                    expect(sector.valid) == true
                }
            }
            
            describe("a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are listed alphabetically.") {
                it("a-b-c-d-e-f-g-h-987[abcde] is a real room") {
                    let sector = Sector("a-b-c-d-e-f-g-h-987[abcde]")
                    expect(sector.valid) == true
                }
            }
            
            describe("not-a-real-room-404[oarel] is a real room.") {
                it("not-a-real-room-404[oarel] is a real room.") {
                    let sector = Sector("not-a-real-room-404[oarel]")
                    expect(sector.valid) == true
                }
            }
            
            describe("totally-real-room-200[decoy] is not a real room.") {
                it("totally-real-room-200[decoy] is not a real room.") {
                    let sector = Sector("totally-real-room-200[decoy]")
                    expect(sector.valid) == false
                }
            }
        }
        
        describe("What is the sum of the sector IDs of the real rooms?") {
            describe("Part 1 - Read input instructions") {
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
        }
        
        describe("What is the sector ID of the room where North Pole objects are stored?") {
            describe("Part 2 - Read input instructions") {
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
}
