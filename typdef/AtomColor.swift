//
//  AtomColor.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/14.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
import UIKit

enum AtomColor: String {
    case H, C, O, N, S, Na, Cl, Fe, Cu, Ag;
    
    static func getAtomColor(_ atomColor: String) -> (UIColor, isBlack: Bool) {
        switch atomColor {
        case "H":
            return (UIColor.cyan, false)
        case "C":
            return (UIColor.black, true)
        case "O":
            return (.orange, false)
        case "N":
            return (.blue, false)
        case "S":
            return (.yellow, false)
        case "Na":
            return (.magenta, false)
        case "Cl":
            return (.green, false)
        case "Fe":
            return (.purple, false)
        case "Cu":
            return (.red, false)
        case "Ag":
            return (UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1), false)
        default:
            return (.white, false)
        }
    }
}
