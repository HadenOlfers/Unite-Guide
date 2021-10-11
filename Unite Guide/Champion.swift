//
//  Champion.swift
//  Unite Guide
//
//  Created by Haden Olfers on 7/31/21.
//

import Foundation

struct champion: Equatable {
    let name: String
    var rank: Int
    let position: Position
    let secondPos: Position
    
    let moveOne: String
    let moveTwo: String
    let moveThree: String
    let moveFour: String
    let moveFive: String
    let moveSix: String
    let moveUlt: String
    
    let bOneMoveOne: String
    let bOneMoveTwo: String
    
    let buildOne: String
    let bOneMoveThree: String
    let bOneMoveFour: String
    let bOnebattleItem: String
    let bOneheldItems: [String]
    
    let buildTwo: String
    let bTwoMoveThree: String
    let bTwoMoveFour: String
    let bTwobattleItem: String
    let bTwoheldItems: [String]
    
    let buildThree: String
    let bThreeMoveThree: String
    let bThreeMoveFour: String
    let bThreebattleItem: String
    let bThreeheldItems: [String]
    
    let counterChamps: [String]
    let ability: String
    
    init(name: String, rank: Int, position: Position, secondPos: Position, moveOne: String, moveTwo: String, moveThree: String, moveFour: String, moveFive: String, moveSix: String, moveUlt: String, bMoveOne: String, bMoveTwo: String, buildOne: String, bOneMoveThree: String, bOneMoveFour: String, bOneBattleItem: String, bOneHeldItems: [String], buildTwo: String, bTwoMoveThree: String, bTwoMoveFour: String, bTwoBattleItem: String, bTwoHeldItems: [String], buildThree: String, bThreeMoveThree: String, bThreeMoveFour: String, bThreeHeldItems: [String], bThreeBattleItem: String, counterChamps: [String], ability: String) {
        
        self.name = name
        self.rank = rank
        self.position = position
        self.secondPos = secondPos
        
        self.moveOne = moveOne
        self.moveTwo = moveTwo
        self.moveThree = moveThree
        self.moveFour = moveFour
        self.moveFive = moveFive
        self.moveSix = moveSix
        self.moveUlt = moveUlt
        
        self.bOneMoveOne = bMoveOne
        self.bOneMoveTwo = bMoveTwo
        
        self.buildOne = buildOne
        self.bOneMoveThree = bOneMoveThree
        self.bOneMoveFour = bOneMoveFour
        self.bOnebattleItem = bOneBattleItem
        self.bOneheldItems = bOneHeldItems
        
        self.buildTwo = buildTwo
        self.bTwoMoveThree = bTwoMoveThree
        self.bTwoMoveFour = bTwoMoveFour
        self.bTwobattleItem = bTwoBattleItem
        self.bTwoheldItems = bTwoHeldItems
        
        self.buildThree = buildThree
        self.bThreeMoveThree = bThreeMoveThree
        self.bThreeMoveFour = bThreeMoveFour
        self.bThreebattleItem = bThreeBattleItem
        self.bThreeheldItems = bThreeHeldItems
        
        self.counterChamps = counterChamps
        self.ability = ability
    }
}

enum Position {
    case top
    case jungle
    case support
    case bottom
    case none
}
