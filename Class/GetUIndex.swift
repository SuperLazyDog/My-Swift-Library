//
//  GetUIndex.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/15.
//  Copyright © 2017年 engjo. All rights reserved.
//

import UIKit
import Foundation

class GETUIndex {
    private var index: Int = 0 //一つのインデックス
    private var indexs: [Int] = [] //インデックスの配列
    private let targetButArray: [UIButton] //探したいやつの配列
    private let targetBut: UIButton //探したいボタン
    
    private let butOriginArray: [UIButton] //探したいものが属された配列
    
    //-----------------イニシャライザ-------------------
    //何もしない簡単なイニシャライザ
    init(target: UIButton, originArray: [UIButton]) {
        targetBut = target
        targetButArray = [target]
        butOriginArray = originArray
        index = searchAnIndex(target: target)
    }
    
    init(mulTargets: [UIButton], originArray: [UIButton]) {
        targetBut = mulTargets[0]
        targetButArray = mulTargets
        butOriginArray = originArray
        indexs = searchManyIndex(mulTarget: mulTargets)
    }
    //サーチをするイニシャライザ
    //---------------------関数-----------------------
    //関数1.1
    //一つのインデックスを探して帰す
    private func searchAnIndex() -> Int {
        var count = 0
        for temp in butOriginArray {
            if targetBut == temp {
                return count
            }
            count += 1
        }
        return -1
    }
    private func searchAnIndex(target: UIButton) -> Int {  //引数のあるバージョン
        var count = 0
        for temp in butOriginArray {
            if target == temp {
                return count
            }
            count += 1
        }
        return -1
    }
    
    //関数2.1
    //複数のインデックスを探して帰す
    private func searchManyIndex() -> [Int] {
        var indexArray: [Int] = []
        for temp in targetButArray {
            let index = searchAnIndex(target: temp)
            if index >= 0 {
                indexArray.append(index)
            }
        }
        return indexArray
    }
    private func searchManyIndex(mulTarget: [UIButton]) -> [Int]{ //引数のあるバージョン
        var indexArray: [Int] = []
        for temp in mulTarget {
            let index = searchAnIndex(target: temp)
            if index >= 0 {
                indexArray.append(index)
            }
        }
        return indexArray
    }
    
    //関数3.1
    //結果を取得
    func getOneResult() -> Int {
        return index
    }
    
    func getResult() -> [Int] {
        return indexs
    }
}
