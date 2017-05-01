//
//  Competitive.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/25.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
//
protocol Competitive {
    var damage: Int { get set }
    func calDamage(_ damage: Int ,_ nowChemicalFormula: Card) -> Int //ダメージを計算して返す
    func caledDamage(_ damage: inout Int ,_ nowChemicalFormula: Card) //ダメージを計算して引数に変更を加える
}

extension Competitive {
    func calDamage(_ damage: Int ,_ nowChemicalFormula: Card) -> Int {
        return damage + Int(nowChemicalFormula.rawValue)
    }
    func caledDamage(_ damage: inout Int ,_ nowChemicalFormula: Card) {
        damage += Int(nowChemicalFormula.rawValue)
    }
}
