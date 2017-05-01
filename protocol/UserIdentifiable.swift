//
//  Identifiable.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/25.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
//必要ないかもしれないが、とりあえず追加しておく
//人間かAIかを判断するため

protocol UserIdentifiable {
    var isAI: Bool { get } //人間か　Bool
    func isHuman() -> Bool    //人間かどうかを判断する関数
}

extension UserIdentifiable {
    func isHuman() -> Bool {
        if isAI {
            return false
        }
        return true
    }
}
