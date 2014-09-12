//
//  WordCounter.swift
//  DemoClass
//
//  Created by techmaster on 9/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
class Word {
    var word: String
    var count: Int = 1
    init(word: String) {
        self.word = word
    }
    func increment() {
        self.count += 1
    }
}
class WordCounter: GenericVC {
    
    var WordCountNSort: [Word] = [Word]()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  if let plainString = self.readFileToString("data.txt") {
        self.countWord(plainString)
        }*/
        
        self.countWord("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
        //self.countWord("aa nn mm cc kk ee cc bb bb ee dd aa")
        //self.countWord("cc kk cc")
    }
    
    func readFileToString(textFile: String) -> String? {
        let fileNameArr = textFile.componentsSeparatedByString(".")
        if fileNameArr.count != 2 { return nil }
        
        let filePath = NSBundle.mainBundle().pathForResource(fileNameArr[0], ofType: fileNameArr[1])
        println("\(filePath)")
        
        return String.stringWithContentsOfFile(filePath!, encoding: NSUTF8StringEncoding, error: nil)
    }
    func shouldRemoveThisWord(word: String) -> Bool {
        
        let dummyWords = ["", " ","a", "all", "an", "i", "in", "is", "it", "are", "were", "he", "she", "they", "it's", "my", "his", "her", "their", "this", "that", "very", "much"]
        if contains(dummyWords, word) { return true }
        
        return false;
    }
    
    func countWord(inputString: String) -> [Word]{
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        var Array = [Word]()
        for item in rawWordArray {
            if !self.shouldRemoveThisWord(item) {
                Array.append(Word(word: item))
                break
            }
        }
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                var num: Int = 0
                for i in Array {
                    if word < i.word {
                        num++
                        if num == Array.count {
                            Array.insert(Word(word: word), atIndex: num)
                            num = 0
                            break
                        }
                    } else if word == i.word {
                        num = 0
                        i.count++
                        break
                    } else if word > i.word {
                        Array.insert(Word(word: word), atIndex: num)
                        num = 0
                        break
                    }
                }
                
            }
            
        }
        var arrayCountNSort = insertWordToWordCountNSort(Array)
        for item in arrayCountNSort {
            self.inRa("\(item.word) : \(item.count)")
        }
        return Array
    }
    
    
    func insertWordToWordCountNSort(array: [Word]) -> [Word] {
        for i in 0..<array.count-1 {
            for j in (i + 1)...array.count-1 {
                var temp = array[j].count
                var string = array[j].word
                if array[i].count < array[j].count {
                    array[j].word = array[i].word
                    array[i].word = string
                    array[j].count = array[i].count
                    array[i].count = temp
                } else if (array[i].count == array[j].count){
                    if(array[i].word < array[j].word){
                        array[j].word = array[i].word
                        array[i].word = string
                        array[j].count = array[i].count
                        array[i].count = temp
                    }
                }
            }
        }
        return array
        
    }
    
}
