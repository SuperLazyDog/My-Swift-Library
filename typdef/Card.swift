//
//  Card.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/25.
//  Copyright © 2017年 engjo. All rights reserved.
//
import Foundation
enum Card: Double {
    //計算のため、共用型バージョンの方がiikamo
    //---1---
    case H2 = 1.0
    
    //---2---
    case O2 = 2.0
    case CO = 2.1
    
    //---3---
    case H2O = 3.0
    case HCl = 3.1
    case CO2 = 3.2
    
    //---4---
    case NaCl = 4.0
    case AgCl = 4.1
    case NaOH = 4.3
    case CuO = 4.4
    case FeO = 4.5
    case N2 = 4.6
    case Cl2 = 4.7
    
    //---5---
    case NH3 = 5.0
    case FeS = 5.1
    case CuS = 5.2
    case H2S = 5.3
    
    //---6---
    case CH4 = 6.0
    case Ag2O = 6.1
    case SO2 = 6.2
    
    //---10---
    case FeCl2 = 10.0
    case CuCl2 = 10.1
    case Ag2S = 10.3
    case HNO3 = 10.4
    
    //---12---
    case NH4Cl = 12.0
    
    //---14---
    case NaHCO3 = 14.0
    
    //---18---
    case Na2CO3 = 18.0
    
    //---20---
    case H2SO4 = 20.0
    
    //---30---
    case C7 = 30.0
    
    //---エラー---
    case other = -1.0
}
var topDefalutAllCard: [Card] {
    return [Card.H2, .O2, .CO, .H2O, .HCl, .CO2, .NaCl, .AgCl, .NaOH, .CuO, .FeO, .N2, .Cl2, .NH3, .FeS, .CuS, .H2S, .CH4, .Ag2O, .SO2, .FeCl2, .CuCl2, .Ag2S, .NH4Cl, .NaHCO3, .Na2CO3, .H2SO4]
}

//バトルで原子から分子にマッチングする時のリファレンス
enum CardRef: String {
    //---1---
    case H2
    
    //---2---
    case O2
    case CO
    
    //---3---
    case H2O
    case HCl
    case CO2
    
    //---4---
    case NaCl
    case AgCl
    case NaOH
    case CuO
    case FeO
    case N2
    case Cl2
    
    //---5---
    case NH3
    case FeS
    case CuS
    case H2S
    
    //---6---
    case CH4
    case Ag2O
    case SO2
    
    //---10---
    case FeCl2
    case CuCl2
    case Ag2S
    case HNO3
    
    //---12---
    case NH4Cl
    
    //---14---
    case NaHCO3
    
    //---18---
    case Na2CO3
    
    //---20---
    case H2SO4
    
    //---30---
    case C7
    
    //---エラー---
    case other
    
    func getName() -> String {
        switch self.rawValue {
        case "H2":
            return "水素分子"
        case "O2":
            return "酸素分子"
        case "CO":
            return "一酸化炭素"
        case "H2O":
            return "水"
        case "HCl":
            return "塩化水素"
        case "CO2":
            return "二酸化炭素"
        case "NaCl":
            return "塩化ナトリウム"
        case "AgCl":
            return "塩化銀"
        case "NaOH":
            return "水酸化ナトリウム"
        case "CuO":
            return "酸化銅"
        case "FeO":
            return "酸化鉄"
        case "N2":
            return "窒素分子"
        case "Cl2":
            return "塩素分子"
        case "NH3":
            return "アンモニア"
        case "FeS":
            return "硫化鉄"
        case "CuS":
            return "硫化銅"
        case "H2S":
            return "硫化水素"
        case "CH4":
            return "メタン"
        case "Ag2O":
            return "酸化銀"
        case "SO2":
            return "二酸化硫黄"
        case "FeCl2":
            return "塩化鉄"
        case "CuCl2":
            return "塩化銅"
        case "Ag2S":
            return "硫化銀"
        case "HNO3":
            return "硝酸"
        case "NH4Cl":
            return "塩化アンモニウム"
        case "NaHCO3":
            return "炭酸水素ナトリウム"
        case "Na2CO3":
            return"炭酸ナトリウム"
        case "H2SO4":
            return "硫酸"
        case "C7":
            return "ダイヤモンド"
        default:
            return "wrong"
        }
    }
}





var AllCardRef: [CardRef] {
    return [.H2, .O2, .CO, .H2O, .HCl, .CO2, .NaCl, .AgCl, .NaOH, .CuO, .FeO, .N2, .Cl2, .NH3, .FeS, .CuS, .H2S, .CH4, .Ag2O, .SO2, .FeCl2, .CuCl2, .Ag2S, .HNO3,.NH4Cl, .NaHCO3, .Na2CO3, .H2SO4, .C7]
}

//カード自体とリファレンスをもつタプル
//バトルのため
    //1
let H2 = (card: Card.H2, ref: CardRef.H2)
    //2
let O2 = (card: Card.O2, ref: CardRef.O2)
let CO = (card: Card.CO, ref: CardRef.CO)
    //3
let H2O = (card: Card.H2O, ref: CardRef.H2O)
let HCl = (card: Card.HCl, ref: CardRef.HCl)
let CO2 = (card: Card.CO2, ref: CardRef.CO2)
    //4
let NaCl = (card: Card.NaCl, ref: CardRef.NaCl)
let AgCl = (card: Card.AgCl, ref: CardRef.AgCl)
let NaOH = (card: Card.NaOH, ref: CardRef.NaOH)
let CuO = (card: Card.CuO, ref: CardRef.CuO)
let FeO = (card: Card.FeO, ref: CardRef.FeO)
let N2 = (card: Card.N2, ref: CardRef.N2)
let Cl2 = (card: Card.Cl2, ref: CardRef.Cl2)
    //5
let NH3 = (card: Card.NH3, ref: CardRef.NH3)
let FeS = (card: Card.FeS, ref: CardRef.FeS)
let Cus = (card: Card.CuS, ref: CardRef.CuS)
let H2S = (card: Card.H2S, ref: CardRef.H2S)
    //6
let CH4 = (card: Card.CH4, ref: CardRef.CH4)
let Ag2O = (card: Card.Ag2O, ref: CardRef.Ag2O)
let SO2 = (card: Card.SO2, ref: CardRef.SO2)
    //10
let FeCl2 = (card: Card.FeCl2, ref: CardRef.FeCl2)
let CuCl2 = (card: Card.CuCl2, ref: CardRef.CuCl2)
let Ag2S = (card: Card.Ag2S, ref: CardRef.Ag2S)
let HNO3 = (card: Card.HNO3, ref: CardRef.HNO3)
    //12
let NH4Cl = (card: Card.NH4Cl, ref: CardRef.NH4Cl)
    //14
let NaHCO3 = (card: Card.NaHCO3, ref: CardRef.NaHCO3)
    //18
let Na2CO3 = (card: Card.Na2CO3, ref: CardRef.Na2CO3)
    //20
let H2SO4 = (card: Card.H2SO4, ref: CardRef.H2SO4)
    //30
let C7 = (card: Card.C7, ref: CardRef.C7)
    //other
let other = (card: Card.other, ref: CardRef.other)
//array
let cardComRef = [H2, O2, CO, H2O, HCl, CO2, NaCl, AgCl, NaOH, CuO, FeO, N2, Cl2, NH3, FeS, Cus, H2S, CH4, Ag2O, SO2, FeCl2, CuCl2, Ag2S, HNO3, NH4Cl, NaHCO3, Na2CO3, H2SO4, C7, other]

/*小文字のバージョン
 enum Card: Double {
 //同じ実体値が許されないから、
 //いったん浮動小数点数として、使うときにキャストする
     case h2 = 1
     
     case o2 = 2.0
     case co = 2.1
     
     case H2O = 3.0
     case hci = 3.1
     case co2 = 3.2
     
     case nacl = 4.0
     case agcl = 4.1
     case naoh = 4.3
     case cuo = 4.4
     case feo = 4.5
     case n2 = 4.6
     case cl2 = 4.7
     
     case nh3 = 5.0
     case FeS = 5.1
     case CuS = 5.2
     case h2s = 5.3
     
     case ch4 = 6.0
     case ag2O = 6.1
     case so2 = 6.2
     
     case fecl2 = 10.0
     case cucl2 = 10.1
     case Ag2S = 10.3
     case Hno3 = 10.4
     
     case nh4cl = 12.0
     
     case nahco3 = 14.0
     
     case na2co3 = 18.0
 
     case h2so4 = 20.0
 
     case C7 = 30.0
 }*/
