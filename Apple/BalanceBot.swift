//
//  BalanceBot.swift
//  AppleAssignment
//
//  Created by Surendra Singh on 9/17/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//

import Foundation

class BalanceBot: NSObject {
    
    var allBots : [Int:Bot] = [:]
    var allOutputs : [Int:Int] = [:]
    
    func activate( bot : Int ) -> [Int] {
        var chainReaction : [Int] = []
        
        func deliver( _ type : BotType, _ bot : Int, _ val : Int ) {
            switch type {
            case .bot:
                if let dest = allBots[bot] {
                    dest.values.append( val )
                    if dest.values.count == 2 {
                        chainReaction.append( bot )
                    }
                }
            case .output:
                allOutputs[bot] = val
            }
        }
        if let b = allBots[bot] {
            precondition( b.values.count == 2 )
            
            b.fired = true
            if let bc = b.gives {
                switch bc {
                case let .gives( _, lowType, lowNum, highType, highNum ):
                    if let low = b.values.min() {
                        deliver( lowType, lowNum, low )
                    }
                    if let high = b.values.max() {
                        deliver( highType, highNum, high )
                    }
                case .input:
                    preconditionFailure( "Bot has input rule." )
                }
            }
        }
        return chainReaction
    }
    
    func activateChain( bots : [Int] ) {
        var botQ = bots
        
        while botQ.count > 0 {
            let nextBot = botQ.removeFirst()
            let chain = activate( bot:nextBot )
            botQ.append( contentsOf: chain )
        }
    }
    
    func problem( input:String ) -> (Int?, [Int:Int], [Int:Bot] ) {
        
        let commands = input._lines.map( BotCommand.Parse )
        var ready : [Int] = []
        
        for co in commands {
            if let c = co {
                switch c {
                case let .input( value, bot ):
                    if let b = allBots[bot] {
                        b.values.append( value )
                        if b.values.count == 2 {
                            ready.append( bot )
                        }
                    } else {
                        allBots[bot] = Bot( initValue: value )
                    }
                case let .gives( bot, _, _, _, _ ):
                    if let b = allBots[bot] {
                        b.gives = c
                    } else {
                        allBots[bot] = Bot( command:c )
                    }
                }
            }
        }
        
        activateChain( bots:ready )
        var botNumber:Int?
        
        for ( bn, b ) in allBots {
            if b.values == [17, 61] || b.values == [61, 17] {
               botNumber = bn
            }
        }
       return(botNumber ,allOutputs, allBots)
    }

}
