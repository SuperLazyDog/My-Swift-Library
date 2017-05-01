//
//  Cards.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/24.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

protocol Atoms: class,CustomStringConvertible {
    //全ての手役、　原子
    var defalutAllCard: [Card] { get }
    var defalutAtom: [Atom] { get }
    //associatedtype Atom //カード型
    //--------------------------Card-------------------------------
    var originAtoms: [Atom] { get } //手持ち原子カードからなる配列 定数
    var nowAtoms: [Atom] { get set } //手持ち原子カードからなる配列　変数
    var atomsTotal: Int { get } //　同時に持つこと可能な原子カード数（最大限） 定数
    var totalNumOfAtomsNow: Int { get set } //今手持ち原子カードの総数
    var usedHowManyTimeAtom: Int { get set } //すでに何回原子Cardを使ったか
    //numofCards + usedHowManyTimeCard = allCardsNum
    //残ったやつを次のターンに引き継ぐ　全部残った場合は捨てる
    // numOfCards ~= 0...7 残る
        //---関数1.1---
    func whetherRemainAndWhat(_ usedHMTimes: Int, _ atomsTotal: Int, _ nowCards: [Atom]) -> (Bool, [Atom])
    func whetherRemainAndWhat() -> (Bool, [Atom]) //引数のないバージョン
    //引数：すでに何回を使ったかを表す整数　戻り値：（残すか, 何を）
    //falseの場合、空配列を返す
        //---関数1.2---
    func usedAtomProcesser(_ arrayIndex: Int)
        //---関数1.3---
    func isGotoAttack(_ nowCardNum: Int) -> Bool
    func isGotoAttack() -> Bool //引数のないバージョン
    //-------------------------------------------------------------
    
    //----------------------------SP-------------------------------
    //最初は全部使えるから、Boolが入らない
    //var originSPCards: [(Card, Bool)] { get }  //SP原子カードタプルの配列 定数
    var originSPAtoms: [Atom] { get }  //SP原子カードタプルの配列 定数
    var allSPAtoms: [(Atom, Bool)] { get set }  //SP原子カードタプルの配列変数
    // [(Card, Bool)]   Card: カード　Bool:このカードは利用可能か
    var limitSPUse: Int { get } //合わせて何回まで使えるか 定数
    var isUsedSPNow: Bool { get set } //このターンにSPを使ったか
    var usedHowManyTimeSP: Int { get set } //すでに何回SPを使ったか
        //---関数2.1---
    func canUseSPFrontTurn(_ usedHMT: Int, canUsedHMT: Int) -> Bool
    func canUseSPFrontTurn() -> Bool //引数のないバージョン
    //このターンにSPが使えるか
    //引数：　usedHMT:今まで何回使うか canUsedHMT:合わせて何回まで使えるか
    //戻り値：　まだSPが今回使える:true　今回は使えない:false
        //---関数2.2---
    func usedSPProcesser(_ arrayIndex: Int)
    //このターンにSPを使った場合の細かい処理
    //引数：使ったSPの添え字
    //-------------------------------------------------------------
    //-------------------------任意に選択----------------------------
    func  arbitrarilySelectedOne(_ cardsArray: [Card]) -> Card //一つをランダムに選ぶ
    func  arbitrarilySelected(_ howMany: Int, _ cardsArray: [Card]) -> [Card]
    func  arbitrarilySelectedOne(_ atomArray: [Atom]) -> Atom //一つをランダムに選ぶ
    func  arbitrarilySelected(_ howMany: Int, _ atomArray: [Atom]) -> [Atom]
}

//---------------------------------------------------------
//            全ての手役、原子
//---------------------------------------------------------
extension Atoms {
    var defalutAllCard: [Card] {
        return [Card.H2, .O2, .CO, .H2O, .HCl, .NaCl, .AgCl, .NaOH, .CuO, .FeO, .N2, .NH3, .FeS, .CuS, .CH4, .Ag2O, .FeCl2, .CuCl2, .Ag2S, .NH4Cl, .NaHCO3, .Na2CO3]
    }
    var defalutAtom: [Atom] {
        return [Atom.H, Atom.C, Atom.O, Atom.N, Atom.S, .Na, .Cl, .Fe, .Cu, .Ag]
    }
}

//---------------------------------------------------------
//            descriptionのデフォルトの実装
//---------------------------------------------------------
extension Atoms {
    var description: String { //デバッグのため　デフォルト文字列出力の実装を追加してく
        return "Card:\n nowAtoms:\(nowAtoms) atomsTotal:\(atomsTotal) totalNumOfAtomsNow:\(totalNumOfAtomsNow) usedHowManyTimeAtom\(usedHowManyTimeAtom)\n SP:\n  allSPAtoms\(allSPAtoms) limitSPUse\(limitSPUse) isUsedSPNow\(isUsedSPNow) usedHowManyTimeSP\(usedHowManyTimeSP)"
    }
}

//---------------------------------------------------------
//               cardに関する処理の実装
//---------------------------------------------------------
extension Atoms {
    //---計算型インスタンスプロパティ---
    var atomsTotal: Int { //手札の枚数：Int 8
         return 8
    }
    //---関数1.1---
    func whetherRemainAndWhat(_ usedHMTimes: Int, _ atomsTotal: Int, _ nowAtoms: [Atom]) -> (Bool, [Atom]) {
        if usedHMTimes >= atomsTotal {
            return (true, nowAtoms)
        }
        return (false, [])
    }
    func whetherRemainAndWhat() -> (Bool, [Atom]) {//引数のないバージョン
        if usedHowManyTimeAtom >= atomsTotal {
            return (true, nowAtoms)
        }
        return (false, [])
    }
    
    //---関数1.2---
    //mutating func usedCardProcesser(_ arrayIndex: Int) {
    func usedAtomProcesser(_ arrayIndex: Int) {
        usedHowManyTimeAtom += 1
        totalNumOfAtomsNow -= 1
        nowAtoms.remove(at: arrayIndex)
    }
    
    //---関数1.3---
    func isGotoAttack(_ nowCardNum: Int) -> Bool {
        if nowCardNum <= 0 {
            return true
        }
        return false
    }
    func isGotoAttack() -> Bool  { //引数のないバージョン
        if totalNumOfAtomsNow <= 0 {
            return true
        }
        return false
    }
}

//---------------------------------------------------------
//                SPに関する処理の実装
//---------------------------------------------------------
extension Atoms {
    //---計算型インスタンスプロパティ---
    var limitSPUse: Int { //利用制限数：Int=3
         return 3
    }
    //---関数2.1---
    func canUseSPFrontTurn(_ usedHMT: Int, canUsedHMT: Int) -> Bool {
        if usedHMT >= canUsedHMT {
            return false
        }
        return true
    }
    func canUseSPFrontTurn() -> Bool {//引数のないバージョン
        if usedHowManyTimeSP >= limitSPUse {
            return false
        }
        return true
    }
    //---関数2.2---
    //mutating func usedSPProcesser(_ arrayIndex: Int) {
    func usedSPProcesser(_ arrayIndex: Int) {
        isUsedSPNow = true
        usedHowManyTimeSP += 1
        allSPAtoms.remove(at: arrayIndex)
    }
}

//---------------------------------------------------------
//               　任意に選択機能の実装
//---------------------------------------------------------
extension Atoms {
    //card
    //アルゴリズム
    //今の所、最高は18
    //19で割った余りに一番近い
    //同じ距離だったら小さい方に(さらにランダムしたい場合はランダム数が奇数か偶数かで決まる)
    //一枚を選び出す
    func  arbitrarilySelectedOne(_ cardsArray: [Card]) -> Card {
        let randowNum = Int(arc4random()%19);
        var smallestDistant: Int = 18; //絶対取れない大きな値
        var selectedCard: Card = .other;
        for card in cardsArray {
            let nowDistant = abs(Int(card.rawValue) - randowNum);
            if nowDistant < smallestDistant {
                smallestDistant = nowDistant;
                selectedCard = card;
            }
        }
        return selectedCard
    }
    //複数枚を選び出す
    func  arbitrarilySelected(_ howMany: Int, _ cardsArray: [Card]) -> [Card] {
        var retCard: [Card] = [];
        for _ in 0..<howMany {
            retCard.append(arbitrarilySelectedOne(cardsArray));
        }
        return retCard;
    }
    //atom
    func  arbitrarilySelectedOne(_ atomArray: [Atom]) -> Atom { //一つをランダムに選ぶ
        let count = atomArray.count
        let randomNum = Int(arc4random())%count
        return atomArray[randomNum]
    }
    func  arbitrarilySelected(_ howMany: Int, _ atomArray: [Atom]) -> [Atom] {
        var atomArrayTemp:[Atom] = []
        for _ in 0..<howMany {
            atomArrayTemp.append(arbitrarilySelectedOne(atomArray))
        }
        return atomArrayTemp
    }
}

//---------------------------------------------------------
//                 　　 test
//---------------------------------------------------------
//プロトコルに列挙型を付属型にすることができるかを確かめるため
/*
class Test: Cards {
    enum Card: Int {
        case example
    }
    var numOfCards: Int = 0
    var nowCards: [Test.Card] = []
    var allCardsNum: Int = 0
    var usedHowMany: Int = 0
    var nowSPCards: [Test.Card] = []
    var limitSPUse: Int = 0
    var isUsedSPNow: Bool = false
    var description: String {
        return ""
    }
}*/
