//
//  AtomicSymbol.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/30.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation


enum Atom: String, Equatable, Comparable {
    case H, C, O, N,S, Na, Cl, Fe, Cu, Ag;
    
    static func ==(lhs: Atom, rhs: Atom) -> Bool {//Equatable継承の実装
        if lhs.rawValue == rhs.rawValue {
            return true
        }
        return false
    }
    
    public static func <(lhs: Atom, rhs: Atom) -> Bool {//Comparable継承の実装
        var lhsValue = -1
        var rhsValue = -1
        for temp in topAtomComref {
            if lhs == temp.atom {
                lhsValue = temp.ref.rawValue
            }
            if rhs == temp.atom {
                rhsValue = temp.ref.rawValue
            }
        }
        return lhsValue < rhsValue
    }
}


enum AtomValue: Int { //大小比較のための対照
    case H, C, O, N,S, Na, Cl, Fe, Cu, Ag;
}

let comH = (atom: Atom.H, ref: AtomValue.H)
let comC = (atom: Atom.C, ref: AtomValue.C)
let comO = (atom: Atom.O, ref: AtomValue.O)
let comN = (atom: Atom.N, ref: AtomValue.N)
let comS = (atom: Atom.S, ref: AtomValue.S)
let comNa = (atom: Atom.Na, ref: AtomValue.Na)
let comCl = (atom: Atom.Cl, ref: AtomValue.Cl)
let comFe = (atom: Atom.Fe, ref: AtomValue.Fe)
let comCu = (atom: Atom.Cu, ref: AtomValue.Cu)
let comAg = (atom: Atom.Ag, ref: AtomValue.Ag)
var topAtomComref: [(atom: Atom, ref: AtomValue)] {
    return [comH, comC, comO, comN, comS, comNa, comCl, comFe, comCu, comAg]
}
/*小文字のバージョン
 enum Atom: String {
 case h, c, o, n, s, na, cl, fe, cu, ag;
 }*/

var topDefalutAtom: [Atom] {
    return [Atom.H, Atom.C, Atom.O, Atom.N, Atom.S, .Na, .Cl, .Fe, .Cu, .Ag]
}

//-------------------------------------------------------------------------
//                    新しい入力を追加する処理
//-------------------------------------------------------------------------
func inputProcesser(lhsStr: String, rhsStr: String) -> String /*(hasNum: Bool, str: String, num: Int)*/ {
    var lhstemp = lhsStr
    var numStr = "" //最後に数字がある場合、削除してここに保存する
    let strTemp = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    //最後に数字があるかどうかに関する処理
    for sufStr in strTemp.reversed() {
        if lhsStr.hasSuffix(sufStr) {//最後に数字がある場合　CH2など
            if Int(sufStr)! < 10 {//一桁の場合、最後の文字を削除（保存）
                numStr = String(lhstemp.remove(at: lhstemp.index(before: lhstemp.endIndex)))
            }else {//二桁の場合、最後の２文字を削除（保存）
                numStr = String(lhstemp.remove(at: lhstemp.index(before: lhstemp.index(before: lhstemp.endIndex))))
                numStr += String(lhstemp.remove(at: lhstemp.index(before: lhstemp.endIndex)))
            }
            
            //rhsとlhsの最後の原子に関する処理
            if lhstemp.hasSuffix(rhsStr) {//rhsとlhsの最後の原子が一致する場合、数字をインクリメントしてlhsに追加
                let plusNum = Int(numStr)! + 1
                return lhstemp + String(plusNum)  //CH3 + H = CH4
            }else{//rhsとlhsの最後の原子が一致しない場合、数字を返してrhsを追加
                return lhsStr + rhsStr // Ag2 + C = Ag2C
            }
        }
    }
    //最後に数字がない場合
    if lhstemp.hasSuffix(rhsStr) {//rhsとlhsの最後の原子が一致する場合
        return lhstemp + "2" // CH + H = CH2
    }else {//rhsとlhsの最後の原子が一致しない場合
        return lhsStr + rhsStr // C + H = CH
    }
}

//-------------------------------------------------------------------------
//                          　分子、原子の結合
//-------------------------------------------------------------------------
//+(:Card, Atom) -> (isCombiOK: Bool, ComString: String, resCard: Card)
//+(:Atom, Atom) -> (isCombiOK: Bool, ComString: String, resCard: Card)
//isCombiOK結合してできたものが手役か　｜ComString 結合しできた文字列　｜ resCard　できたら手役の点数カード
func +(lhs: Card, rhs: Atom) -> (isCombiOK: Bool, ComString: String, resCard: Card) {
    //H + H = Card.H2        重複の時に数字で表す
    //Na + O + H = Card.NaOH
    //H + Cl = Card.HCl
    //Ag +  CO = Card.other   ない場合はotherを返す
    var lhsRef: CardRef = .other
    for lhsTemp in cardComRef {
        if lhs == lhsTemp.card {
            lhsRef = lhsTemp.ref
        }
    }
    let strTemp = inputProcesser(lhsStr: lhsRef.rawValue, rhsStr: rhs.rawValue)//結合してみる
    //結合してできたものが点数があるかどうか
    for temp in  cardComRef {
        if strTemp == temp.ref.rawValue { //手役と一致する場合
            return (isCombiOK: true, ComString: strTemp, resCard: temp.card)
        }
    }
    //手役と一致しない場合
    return (isCombiOK: false, ComString: strTemp, resCard: .other)
}

func +(lhs: Atom, rhs: Atom) -> (isCombiOK: Bool, ComString: String, resCard: Card) {
    //H + H = Card.H2        重複の時に数字で表す
    //Na + O + H = Card.NaOH
    //H + Cl = Card.HCl
    //Ag +  CO = Card.other   ない場合はotherを返す
    let strTemp = inputProcesser(lhsStr: lhs.rawValue, rhsStr: rhs.rawValue)//結合してみる
    //結合してできたものが点数があるかどうか
    for temp in  cardComRef {
        if strTemp == temp.ref.rawValue { //手役と一致する場合
            return (isCombiOK: true, ComString: strTemp, resCard: temp.card)
        }
    }
    //手役と一致しない場合
    return (isCombiOK: false, ComString: strTemp, resCard: .other)
}
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
