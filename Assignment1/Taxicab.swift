//
//  Taxicab.swift
//  AppleAssignment
//
//  Created by Surendra Singh on 9/15/17.
//  Copyright © 2017 Surendra Singh. All rights reserved.
//


import Foundation
import Cocoa

struct Taxicab {
    
    enum DirectionPoint {
        case north
        case south
        case east
        case west
    }
    
    func move(direction: Direction, previousDirection: DirectionPoint, currentCoordinate: (Int, Int)) -> ((Int, Int), DirectionPoint) {
        
        var newCoordinate = (currentCoordinate, previousDirection)
        switch(previousDirection){
        case .north:
            if(direction.direction == "L"){
                newCoordinate.1 = .west
                newCoordinate.0.0 -= direction.value
            }else{
                newCoordinate.1 = .east
                newCoordinate.0.0 += direction.value
            }
            break
        case .east:
            if(direction.direction == "L"){
                newCoordinate.1 = .north
                newCoordinate.0.1 += direction.value
            }else{
                newCoordinate.1 = .south
                newCoordinate.0.1 -= direction.value
            }
            break
        case .south:
            if(direction.direction == "L"){
                newCoordinate.1 = .east
                newCoordinate.0.0 += direction.value
            }else{
                newCoordinate.1 = .west
                newCoordinate.0.0 -= direction.value
            }
            break
        case .west:
            if(direction.direction == "L"){
                newCoordinate.1 = .south
                newCoordinate.0.1 -= direction.value
            }else{
                newCoordinate.1 = .north
                newCoordinate.0.1 += direction.value
            }
            break
        }
        return newCoordinate
    }
    
    func calcHQDistance(input: String) -> Int {
        //get all directions
        let directions = input.characters.split(separator: ",").map({ (a) -> Direction in
            let s = String(a)
            return Direction(valueString: s)
        })
        
        //Current position
        var coord = (0,0)
        //set previous direction
        var previousDirection : DirectionPoint = .north
        //move all directions
        for direction in directions {
            
            let res = move(direction: direction, previousDirection: previousDirection, currentCoordinate: coord)
            coord = res.0
            previousDirection = res.1
        }
        return abs(coord.0) + abs(coord.1)
    }
    
    func calcDistanceFirstVisitTwice(input: String) -> Int {
        let directions = input.characters.split(separator: ",").map({ (a) -> Direction in
            let s = String(a)
            return Direction(valueString: s)
        })
        
        var coord = (0,0)
        var coords: Set<String> = ["(\(coord.0),\(coord.1))"]
        var previousDirection : DirectionPoint = .north
        directionsLoop: for direction in directions {
            let res = move(direction: direction, previousDirection: previousDirection, currentCoordinate: coord)
            if(coord.0 == res.0.0){
                let upper = ((coord.1 < res.0.1) ? res.0.1 : coord.1 - 1)
                let lower = ((coord.1 > res.0.1) ? res.0.1 : coord.1 + 1)
                for i in lower...upper {
                    let hash = "(\(coord.0),\(i))"
                    if(coords.contains(hash)){
                        coord = (coord.0, i)
                        break directionsLoop;
                    }else{
                        coords.insert(hash)
                    }
                }
                
            }
            if(coord.1 == res.0.1){
                let upper = ((coord.0 < res.0.0) ? res.0.0 : coord.0 - 1)
                let lower = ((coord.0 > res.0.0) ? res.0.0 : coord.0 + 1)
                for i in lower...upper {
                    let hash = ("(\(i),\(coord.1))")
                    if(coords.contains(hash)){
                        coord = (i, coord.1)
                        break directionsLoop;
                    }else{
                        coords.insert(hash)
                    }
                }
            }
            coord = res.0
            previousDirection = res.1
        }
        return abs(coord.0) + abs(coord.1)
    }
    
}
