//
//  Factory.swift
//  slotMachine
//
//  Created by ankurchdry on 12/28/14.
//  Copyright (c) 2014 ankurchdry. All rights reserved.
//

import Foundation
import UIKit


class factory {
    
    class func createSlots() -> [[Slot]] {
        
        let kNumberOfSlots = 3
        let kNumberOfContainers = 3
        
        var slots: [[Slot]] = []
        
        for var containerNumber = 0; containerNumber < kNumberOfSlots; ++containerNumber {
            var arraySlots: [Slot] = []
            for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
                
               // var slot = Slot(value: 0, image: UIImage(named:"Ace"), isRed: true)
                
                var slot = factory.createslot(arraySlots)
                
                arraySlots.append(slot) //Here we setup the columns in our 3x3 block
            }
            
            slots.append(arraySlots) //Here we setup the rows in our 3x3 block
        }
        
        return slots //this returns our arrary of array value
    }
    
    
    class func createslot (currentCards: [Slot]) -> Slot {
        
        var currentCardValues:[Int] = []
        
        for slot1 in currentCards {
            
            currentCardValues.append(slot1.value)
        }
        
        var randomNumber = Int(arc4random_uniform(UInt32(13)))
        while contains(currentCardValues, randomNumber + 1) {
            randomNumber = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot2:Slot
        switch randomNumber {
        case 0:
            slot2 = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
        case 1:
            slot2 = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
        case 2:
            slot2 = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
        case 3:
            slot2 = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
        case 4:
            slot2 = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
        case 5:
            slot2 = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
        case 6:
            slot2 = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
        case 7:
            slot2 = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
        case 8:
            slot2 = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
        case 9:
            slot2 = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
        case 10:
            slot2 = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
        case 11:
            slot2 = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
        case 12:
            slot2 = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
        default:
            slot2 = Slot(value: 0, image: UIImage(named: "Ace"), isRed: true)
        }
        return slot2
    }
}