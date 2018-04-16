//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// test for string with all unique letters

func isStringUnique (strValue: String) -> Bool {
    let chrArray = Array(strValue)
    var chrCount: [String: Int] = [:]
    
    for i in 0..<chrArray.count {
        let keyValue = String(chrArray[i]).lowercased()
        
        if chrCount[keyValue] != nil {
            return false
        }
        
        chrCount[keyValue] = 1
    }
    
    return true
}

isStringUnique(strValue: "Uncopyrightable")
isStringUnique(strValue: "Rhinoceros")
isStringUnique(strValue: "Albuquerque")
isStringUnique(strValue: "Extras")

// test for palindrome

func isPalindrome(strValue: String) -> Bool {
    let strArray = Array(strValue)
    let strLength = strArray.count / 2
    
    var strPart1: String = ""
    var i = 0
    
    while i < strLength {
        strPart1 += String(strArray[i])
        i += 1
    }
    
    var strPart2: String = ""
    i = strArray.count - strLength
    
    while i < strArray.count {
        strPart2 = String(strArray[i]) + strPart2
        i += 1
    }
    
    return strPart1 == strPart2
}

isPalindrome(strValue: "abcdcba")
isPalindrome(strValue: "abccba")
isPalindrome(strValue: "abcdefg")

// sum of largest two integers in array

func sumLargestTwoNumbers(intArray: [Int]) -> Int? {
    var intValue1: Int? = nil
    var intValue2: Int? = nil
    
    for i in 0..<intArray.count {
        if intValue1 == nil {
            intValue1 = intArray[i]
        } else if intArray[i] > intValue1! {
            intValue2 = intValue1
            intValue1 = intArray[i]
        } else if intValue2 == nil {
            intValue2 = intArray[i]
        } else if intArray[i] > intValue2! {
            intValue2 = intArray[i]
        }
    }
    
    if intValue1 == nil {
        return nil
    } else if intValue2 == nil {
            return intValue1
    } else {
        return intValue1! + intValue2!
    }
}

sumLargestTwoNumbers(intArray: [3, 5, 7, 9, 2, 1, 4, 6, 8])
sumLargestTwoNumbers(intArray: [3,5])
sumLargestTwoNumbers(intArray: [3])
sumLargestTwoNumbers(intArray: [])

// FizzBuzz

let x = 100
for i in 1..<x + 1 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}

// reverse word in sentence

func reverseWordInSentence(sentence: String, word: String) -> String {
    let sentenceArray = Array(sentence)
    let wordArray = Array(word)
    
    var newSentence = ""
    var reverseWord = ""
    
    var i = 0
    while i < wordArray.count {
        reverseWord = String(wordArray[i]) + reverseWord
        i += 1
    }
    
    i = 0
    while i < sentenceArray.count {
        var j = 0
        while j < wordArray.count {
            if sentenceArray[i + j] != wordArray[j] {
                break
            }
            j += 1
        }
        
        if j >= wordArray.count {
            newSentence += reverseWord
            i += j
        } else {
            newSentence += String(sentenceArray[i])
            i += 1
        }
    }
    
    return newSentence
}

print(reverseWordInSentence(sentence: "What is the best show in town?", word: "town"))

// character count in string

func chrCountInString(strValue: String) {
    let strArray = Array(strValue)
    var chrCount: [String: Int] = [:]
    
    for i in 0..<strArray.count {
        let keyValue = String(strArray[i])
        if chrCount[keyValue] == nil {
            chrCount[keyValue] = 1
        } else {
            chrCount[keyValue] = chrCount[keyValue]! + 1
        }
    }

    // print(chrCount.sorted(by: {$0.value > $1.value}))
    
    var sortKey: [String] = []
    var sortValue: [Int] = []
    
    for item in chrCount {
        sortKey.append(item.key)
        sortValue.append(item.value)
    }
    
    var i = 1
    var swapCount = 0
    while true {
        if i < sortKey.count {
            if sortKey[i] > sortKey[i - 1] {
                sortKey.swapAt(i, i - 1)
                sortValue.swapAt(i, i - 1)
                swapCount += 1
            }

            i += 1
        } else {
            if swapCount == 0 {
                break
            }

            i = 1
            swapCount = 0
        }
    }
    
    for i in 0..<sortKey.count {
        print(sortKey[i], sortValue[i])
    }
}

chrCountInString(strValue: "What is the best show in town?")
