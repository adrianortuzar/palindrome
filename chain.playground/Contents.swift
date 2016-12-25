//: Playground - noun: a place where people can play

import UIKit


func splitString(_ str:String, everyCharacters splitNumber:Int) -> [String] {
    
    var result = [String]()
    
    let arra = Array(str.characters)
    
    
    for (i, _) in arra.enumerated() {
        
        let rest : Int = (i + splitNumber) - str.characters.count
        
        if rest <= 0 {
            let start = str.index(str.startIndex, offsetBy: i)
            let end = str.index(str.endIndex, offsetBy: rest)
            let range = start..<end
            print("rest ",rest)
            let substring = str.substring(with: range)
            result.append(substring)
        }
        else{
            break
        }
        
        
    }
    
    return result
}

func repetionDic(str:String) -> [String:Bool]{
    
    
    var result = [String:Bool]()
    
    let arra = Array(str.characters)
    
    for str in arra {
        if let repetion = result[str.description] {
            result[str.description] = (repetion) ? false : true
        }
        else {
            result[str.description] = false
        }
    }
    
    return result
}

func isCapicua(str:String) -> Bool{
    
    let repetionDicc = repetionDic(str: str)
    
    let isEven :Bool = (str.characters.count == 1 || str.characters.count % 2 == 1) ? false : true

    
    var result = true
    
    if isEven {
        let resul = repetionDicc.filter {
            $0.1 == false
        }
        result = (resul.count > 0) ? false : true
    } else {
        let resul = repetionDicc.filter {
            $0.1 == false
        }

        result = (resul.count > 1) ? false : true
    }
    
    return result
}




func result(_ chain:String) -> [String]{
    
    var result = [String]()
    
    let arra = Array(chain.characters)
    
    for (i, _) in arra.enumerated() {
        let splitArray = splitString(chain, everyCharacters: i + 1)
        for str in splitArray {
            if (isCapicua(str: str)) {
                result.append(str)
            }
        }
    }
    
    return result
}


let chain = "02002"
result(chain)