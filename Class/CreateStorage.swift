//
//  CreateStore.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/14.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

class CreateStorage {
    private var atomStorage: [Atom] = []
    
    private var scoreStorage: [Int] = [] //点数のため
    private var isScore: Bool = false //点数のため
    
    //-----------------イニシャライザ-------------------
    //何もしない簡単なイニシャライザ
    init() {
        atomStorage = []
    }
    //何もしない簡単なイニシャライザ
    init(isScore: Bool) {
        self.isScore = isScore
    }
    //---------------------関数-----------------------
    //関数1.1
    //新しいものいくつかを入れる　グローバル
    func putNewInStorage(what: Atom, howMany: Int) {
        for _ in 0..<howMany {
            atomStorage.append(what)
        }
    }
    //点数バージョン
    func putNewInStorage(what: Int, howMany: Int) {
        for _ in 0..<howMany {
            scoreStorage.append(what)
        }
    }
    //関数1.2
    //いくつかの物からなる配列をストレージに入れる　グローバル
    func putSomeInStorage(what: [Atom]) {
        atomStorage.append(contentsOf: what)
    }
    func putSomeInStorage(what: [Atom], howManyTimes: Int) { //何回も同じ組み合わせを入れる関数　グローバル
        for _ in 0..<howManyTimes {
            atomStorage.append(contentsOf: what)
        }
    }
    
    //点数バージョン
    func putSomeInStorage(what: [Int]) {
        scoreStorage.append(contentsOf: what)
    }
    
    func putSomeInStorage(what: [Int], howManyTimes: Int) { //何回も同じ組み合わせを入れる関数　グローバル
        for _ in 0..<howManyTimes {
            scoreStorage.append(contentsOf: what)
        }
    }
    //関数2.1
    //ストレージを取得
    func getStorage() -> [Atom] {
        return atomStorage
    }
    
    func getScoreStorage() -> [Int] {
        return scoreStorage
    }
}
