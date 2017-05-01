//
//  CardIdentifiable.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/25.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

//必要ないと判断できたが、将来の機能追加などを備えて、
//あえて追加しておく
//カードの種類を判断するため

protocol CardIdentifiable {
    var nowCard: Card { get set }
    func getCardScore(_ nowCard: Card) -> Int
}

extension CardIdentifiable {
    func getCardScore(_ nowCard: Card) -> Int {
        return Int(nowCard.rawValue);
    }
}
