//
//  day1Tests.swift
//  Apple
//
//  Created by Surendra Singh on 10/4/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Quick
import Nimble

@testable import Apple

class day1Tests: QuickSpec {
    override func spec() {
        
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "day1", ofType: "txt")!
        let instructions =  try! String(contentsOfFile:path)
        let taxiCab = Taxicab()
        
        describe("No Time for a Taxicab") {
            describe("Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away") {
                it("Always returns 5") {
                    expect(taxiCab.calcHQDistance(input:"R2, L3")) == 5
                }
            }
            
            describe("R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away") {
                it("Always returns 2") {
                    expect(taxiCab.calcHQDistance(input:"R2, R2, R2")) == 2
                }
            }
            
            describe("R5, L5, R5, R3 leaves you 12 blocks away") {
                it("Always returns 12") {
                    expect(taxiCab.calcHQDistance(input:"R5, L5, R5, R3")) == 12
                }
            }
        }
        
        describe("How many blocks away is Easter Bunny HQ?") {
            describe("Part 1 - Read input instructions") {
                it("Your puzzle answer was 185") {
                    expect(taxiCab.calcHQDistance(input:instructions)) == 185
                }
            }
        }
        
        describe("How many blocks away is the first location you visit twice?") {
            describe("Part 2 - Read input instructions") {
                it("Your puzzle answer was 140.") {
                    expect(taxiCab.calcDistanceFirstVisitTwice(input:instructions)) == 140
                }
            }
        }
    }
}
