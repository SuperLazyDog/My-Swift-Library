//
//  RandowChoose.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/01.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

class RandomChoose{
    //atom
    private let originAtomTemp: [Atom]
    private let howManyAtom: Int
    private var choosedAtoms: [Atom] = []
    //SP
    private let originSPTemp: [Card]
    private let howManySP: Int
    private var choosedSP: [Atom] = []
    
    init(atomArray: [Atom], howManyAtom: Int) {
        self.originAtomTemp = atomArray
        self.howManyAtom = howManyAtom
        //ダミー SPのランダム抽選機能が入らないため
        originSPTemp = []; howManySP = 0;
        choosedAtoms = arbitrarilySelected(howManyAtom, originAtomTemp)
    }
    init(howManyAtom: Int = 8) {
        self.originAtomTemp = topDefalutAtom
        self.howManyAtom = howManyAtom
        //ダミー SPのランダム抽選機能が入らないため
        originSPTemp = []; howManySP = 0;
        choosedAtoms = arbitrarilySelected(howManyAtom, originAtomTemp)
    }
    //---------------------------------------------------------
    //                       atom
    //---------------------------------------------------------
    //一枚を選び出す
    private func  arbitrarilySelectedOne(_ atomArray: [Atom]) -> Atom { //一つをランダムに選ぶ
        let count = atomArray.count
        
        let cnt = Int(count)
        
        let randomNum = Int(arc4random_uniform(UInt32(cnt)))
        return atomArray[randomNum]
    }
    //複数枚を選び出す
    private func  arbitrarilySelected(_ howMany: Int, _ atomArray: [Atom]) -> [Atom] {
        var atomArrayTemp:[Atom] = []
        for _ in 0..<howMany {
            atomArrayTemp.append(arbitrarilySelectedOne(atomArray))
        }
        return atomArrayTemp
    }
    func getAtoms() -> [Atom] {
        return choosedAtoms
    }
    //---------------------------------------------------------
    //                         SP
    //---------------------------------------------------------
    //アルゴリズム:今の所、最高点数は18
    //19で割った余りに一番近い
    //同じ距離だったら小さい方に(さらにランダムしたい場合はランダム数が奇数か偶数かで決まる)
        //一枚を選び出す
    private func  arbitrarilySelectedOne(_ cardsArray: [Card]) -> Card {
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
    private func  arbitrarilySelected(_ howMany: Int, _ cardsArray: [Card]) -> [Card] {
        var retCard: [Card] = [];
        for _ in 0..<howMany {
            retCard.append(arbitrarilySelectedOne(cardsArray));
        }
        return retCard;
    }
}
