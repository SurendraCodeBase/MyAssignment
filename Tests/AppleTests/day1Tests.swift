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
        
        let instructions = try! String(contentsOfFile: "./Tests/AppleTests/day1.txt")
        
        let taxiCab = Taxicab()
        
        describe("DAY - 1 : Always returns 5") {
            it("Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away") {
                expect(taxiCab.calcHQDistance(input:"R2, L3")) == 5
            }
        }
        
        describe("DAY - 1 : Always returns 2") {
            it("R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away") {
                expect(taxiCab.calcHQDistance(input:"R2, R2, R2")) == 2
            }
        }
        
        describe("DAY - 1 : Always returns 12") {
            it("R5, L5, R5, R3 leaves you 12 blocks away") {
                expect(taxiCab.calcHQDistance(input:"R5, L5, R5, R3")) == 12
            }
        }
        
        describe("DAY - 1 : Part 1 - Read input instructions") {
            it("Your puzzle answer was 185") {
                expect(taxiCab.calcHQDistance(input:instructions)) == 185
            }
        }
        
        describe("DAY - 1 : Part 2 - Read input instructions") {
            it("Your puzzle answer was 140.") {
                expect(taxiCab.calcDistanceFirstVisitTwice(input:instructions)) == 140
            }
        }
    }
}
