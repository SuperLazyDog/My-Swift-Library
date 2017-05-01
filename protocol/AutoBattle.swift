//
//  AutoBattle.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/01.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
//テストのため、当面デフォルトはダミーを実装
protocol AutoBattle {
    var difficulty: Difficulty { get }
    func aiDamage(_ cards: [Atom]) -> Int
    func calDamage(_ combi: Card) -> Int
}

extension AutoBattle {
    var difficulty: Difficulty {
        return Difficulty.normal
    }
}

extension AutoBattle {
    func aiDamage(_ cards: [Atom]) -> Int {//AIのバトル
        return 10
    }
    func calDamage(_ combi: Card) -> Int {//ターンのバトル結果を計算
        return 0
    }
}
