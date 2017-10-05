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
        
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "day10", ofType: "txt")!
        let instructions =  try! String(contentsOfFile:path)
        
        let pathTest = bundle.path(forResource: "day10Test", ofType: "txt")!
        let instructionsTest =  try! String(contentsOfFile:pathTest)
        
        describe("Tests - Balance Bots") {
            it("Tests") {

                    let balanceBot = BalanceBot()
                    let result = balanceBot.problem(input: instructionsTest)
                    let allBots : [Int:Bot] = result.2
                    let onezero:Int = allBots[1]!.values[0]
                    expect(onezero) == 3
                    
                    let twozero:Int = allBots[2]!.values[0]
                    expect(twozero) == 5
                    
                    let twoone:Int = allBots[2]!.values[1]
                    expect(twoone) == 2
                    
                    let allOutputs : [Int:Int] = result.1
                    
                    //output bin 0 contains a value-5 microchip
                    expect(allOutputs[0]) == 5
                    
                    //output bin 1 contains a value-2 microchip
                    expect(allOutputs[1]) == 2
                    
                    //output bin 2 contains a value-3 microchip
                    expect(allOutputs[2]) == 3
            }
        }
        
        describe("what is the number of the bot that is responsible for comparing value-61 microchips with value-17 microchips?") {
            describe("Part 1 - Read input instructions") {
                it("Your puzzle answer was 73") {
                    let balanceBot = BalanceBot()
                    let result = balanceBot.problem(input: instructions)
                    expect(result.0) == 73
                }
            }
        }
        
        describe("What do you get if you multiply together the values of one chip in each of outputs 0, 1, and 2?") {
            describe("Part 2 - Read input instructions") {
                it("Your puzzle answer was 3965.") {
                    let balanceBot = BalanceBot()
                    let result = balanceBot.problem(input: instructions)
                    let allOutputs : [Int:Int] = result.1
                    expect((allOutputs[0]! * allOutputs[1]! * allOutputs[2]!)) == 3965
                }
            }
        }
    }
}
