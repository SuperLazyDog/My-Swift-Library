//
//  StringAdapter.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/15.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

//H2Oのような文字列をH₂Oのように変換する
class StringAdapter {
    private let from: String
    private var to: String
    private var strType: StringType
    
    //-----------------イニシャライザ-------------------
    //何もしない簡単なイニシャライザ
    init(from str: String, type: StringType) {
        from = str
        to = ""
        strType = type
    }
    //簡単なイニシャライザ
    init(origin str: String, ouType: StringType) {
        from = str
        to = ""
        strType = ouType
        getAdaptedString(type: strType)
    }
    //---------------------関数-----------------------
    //関数1.1
    //数字から特別な数字へとの変換
    //成功すれば特殊数字を、失敗すればそのままを文字列として返す
    private func convertNumTo(type: StringType, num: Int) -> String {
        let strType = type
        if num < 10 && num >= 0 {
            return getSpecialString(type: strType, num: num)
        }else {
            return String(num)
        }
    }
    //関数1.2 //Int((UnicodeScalar(String(temp))?.value)!)
    //文字列中の数字を全て同じタイプの特殊数字にする
    private func getAdaptedString(type: StringType) {
        for temp in from.characters {
            let charValue = Int((UnicodeScalar("\(temp)")?.value)!)
            if charValue >= String.normalNumMin && charValue <= String.normalNumMax { //数字の場合
                if type == .upper {//上付きにする場合  8304~8313
                    to.append(numUpperArray[charValue-48])
                }else {//下付きにする場合 8320~8329
                    to.append(numUnderArray[charValue-48])
                }
            }else {
                to.append(temp)
            }
        }
    }
    
    //関数2.1 内部加工関数
    //引数の指定により、適当な特殊数字を返す
    private func getSpecialString(type: StringType, num: Int) -> String {
        if type == .under {
            return numUnderArray[num]
        }else {
            return numUpperArray[num]
        }
    }
    
    //関数3.1
    //変換した文字列を取得
    func getResult() -> String {
        return to
    }
}
