//
//  day10Tests.swift
//  Apple
//
//  Created by Surendra Singh on 10/5/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Quick
import Nimble

@testable import Apple

class day10Tests: QuickSpec {
    override func spec() {
        
        let instructions = try! String(contentsOfFile: "./Tests/AppleTests/day10.txt")
        let instructionsTest = try! String(contentsOfFile: "./Tests/AppleTests/day10Test.txt")
        
        let balanceBot = BalanceBot()
        let result = balanceBot.problem(input: instructionsTest)
        let allBots : [Int:Bot] = result.2
        let allOutputs : [Int:Int] = result.1
        
        
        describe("Day - 10 :Test 1") {
            it("Tests") {
                let onezero:Int = allBots[1]!.values[0]
                expect(onezero) == 3
            }
        }
        
        describe("Day - 10 :Test 2") {
            it("Tests") {
                let twozero:Int = allBots[2]!.values[0]
                expect(twozero) == 5
            }
        }
        
        describe("Day - 10 :Test 3") {
            it("Tests") {
                let twoone:Int = allBots[2]!.values[1]
                expect(twoone) == 2
            }
        }
        
        describe("Day - 10 :output bin 0 contains a value-5 microchip") {
            it("output bin 0 contains a value-5 microchip") {
                expect(allOutputs[0]) == 5
            }
        }
        
        describe("Day - 10 :output bin 1 contains a value-2 microchip") {
            it("output bin 1 contains a value-2 microchip") {
                expect(allOutputs[1]) == 2            }
        }
        
        describe("Day - 10 :output bin 2 contains a value-3 microchip") {
            it("output bin 2 contains a value-3 microchip") {
                expect(allOutputs[2]) == 3
                
            }
        }
        
        describe("Day - 10 : Your puzzle answer was 73") {
            it("Your puzzle answer was 73") {
                let balanceBot = BalanceBot()
                let result = balanceBot.problem(input: instructions)
                expect(result.0) == 73
            }
        }
        
        describe("Day - 10 : Part 2 - Read input instructions") {
            it("Your puzzle answer was 3965.") {
                let balanceBot = BalanceBot()
                let result = balanceBot.problem(input: instructions)
                let allOutputs : [Int:Int] = result.1
                expect((allOutputs[0]! * allOutputs[1]! * allOutputs[2]!)) == 3965
            }
        }
    }
}
