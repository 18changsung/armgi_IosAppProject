//
//  DataCenter.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import Foundation

var dataCenter:DataCenter = DataCenter()

class DataCenter: NSObject, NSCoding{

    var studyList:[Int:Study]
    var selectedStudy:Int
    var ddayList:[Int]
    var goalData:GoalData
    var selectedColor:[Int]

    var templateColor:[String]

    override init(){
        self.studyList = [:]
        self.selectedStudy = 0
        self.ddayList = []
        self.goalData = GoalData(currentGoalVal: 0)
        self.selectedColor = []

        self.templateColor = ["#60ADED","#8EFA00","#FFFB00","#FF2600"]
        //순서대로 파란색,초록색,노란색,빨간색
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.studyList, forKey: "studyList")
        aCoder.encode(self.selectedStudy, forKey: "selectedStudy")
        aCoder.encode(self.ddayList, forKey: "ddayList")
        aCoder.encode(self.goalData, forKey: "goalData")
        aCoder.encode(self.selectedColor, forKey: "selectedColor")
        aCoder.encode(self.templateColor, forKey: "templateColor")
    }

    public required init?(coder aDecoder: NSCoder) {
        if let studyList = aDecoder.decodeObject(forKey:"studyList") as? [Int:Study]{
            self.studyList = studyList
        } else {
            self.studyList = [:]
        }
        if let selectedStudy = aDecoder.decodeObject(forKey:"selectedStudy") as? Int{
            self.selectedStudy = selectedStudy
        } else {
            self.selectedStudy = 0
        }
        if let ddayList = aDecoder.decodeObject(forKey:"ddayList") as? [Int]{
            self.ddayList = ddayList
        } else {
            self.ddayList = []
        }
        if let goalData = aDecoder.decodeObject(forKey:"goalData") as? GoalData{
            self.goalData = goalData
        } else {
            self.goalData = GoalData(currentGoalVal: 0)
        }
        if let selectedColor = aDecoder.decodeObject(forKey:"selectedColor") as? [Int]{
            self.selectedColor = selectedColor
        } else {
            self.selectedColor = []
        }
        if let templateColor = aDecoder.decodeObject(forKey:"templateColor") as? [String]{
            self.templateColor = templateColor
        } else {
            self.templateColor = ["#60ADED","#8EFA00","#FFFB00","#FF2600"]
        }
    }
}

class Study: NSObject, NSCoding {
    var subjectName:String
    var unitName:[String]
    var oneUnitData:[OneUnit]

    init(subjectName:String) {
        self.subjectName = subjectName
        self.unitName = []
        self.oneUnitData = []
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.subjectName, forKey: "studyName")
        aCoder.encode(self.unitName, forKey: "unitName")
        aCoder.encode(self.oneUnitData, forKey: "oneUnitData")
    }

    public required init?(coder aDecoder: NSCoder) {
        if let subjectName = aDecoder.decodeObject(forKey:"subjectName") as? String{
            self.subjectName = subjectName
        } else {
            self.subjectName = ""
        }
        if let unitName = aDecoder.decodeObject(forKey:"unitName") as? [String]{
            self.unitName = unitName
        } else {
            self.unitName = []
        }
        if let oneUnitData = aDecoder.decodeObject(forKey:"oneUnitData") as? [OneUnit]{
            self.oneUnitData = oneUnitData
        } else {
            self.oneUnitData = []
        }
    }
}

class OneUnit: NSObject, NSCoding {
    var allWords:[Words] // 단어식
    var allSentences:[String] // 문장식

    init(allWords:[Words], allSentences:[String]) {
        self.allWords = allWords
        self.allSentences = allSentences
    }

    convenience init(allWords:[Words]){
        self.init(allWords: allWords)
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.allWords, forKey: "allWords")
        aCoder.encode(self.allSentences, forKey: "allSentences")
    }

    public required init?(coder aDecoder: NSCoder) {
        if let allWords = aDecoder.decodeObject(forKey:"allWords") as? [Words]{
            self.allWords = allWords
        } else {
            self.allWords = []
        }
        if let allSentences = aDecoder.decodeObject(forKey:"allSenctences") as? [String]{
            self.allSentences = allSentences
        } else {
            self.allSentences = []
        }
    }

}

class Words: NSObject, NSCoding{ //단어들
    var keyword:String
    var explanation:String
    var starFlag:Bool
    var starImageFlag:Bool

    init(keyword:String, explanation:String) {
        self.keyword = keyword
        self.explanation = explanation
        self.starFlag = true
        self.starImageFlag = false
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.keyword, forKey: "keyword")
        aCoder.encode(self.explanation, forKey: "explanation")
        aCoder.encode(self.starFlag, forKey: "starFlag")
        aCoder.encode(self.starImageFlag, forKey: "starImageFlag")
    }

    public required init?(coder aDecoder: NSCoder) {
        if let keyword = aDecoder.decodeObject(forKey:"keyWord") as? String{
            self.keyword = keyword
        } else {
            self.keyword = ""
        }
        if let explanation = aDecoder.decodeObject(forKey:"explanation") as? String{
            self.explanation = explanation
        } else {
            self.explanation = ""
        }
        if let starFlag = aDecoder.decodeObject(forKey:"starFlag") as? Bool{
            self.starFlag = starFlag
        } else {
            self.starFlag = false
        }
        if let starImageFlag = aDecoder.decodeObject(forKey:"starImageFlag") as? Bool{
            self.starImageFlag = starImageFlag
        } else {
            self.starImageFlag = false
        }
    }
}

class GoalData: NSObject, NSCoding {
    var goalList:[Float]
    var currentGoalVal:Float

    init(currentGoalVal:Float) {
        self.goalList = []
        self.currentGoalVal = currentGoalVal
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.goalList, forKey: "goalList")
        aCoder.encode(self.currentGoalVal, forKey: "currentGoalVal")
    }

    public required init?(coder aDecoder: NSCoder) {
        if let goalList = aDecoder.decodeObject(forKey:"goalList") as? [Float]{
            self.goalList = goalList
        } else {
            self.goalList = []
        }
        if let currentGoalVal = aDecoder.decodeObject(forKey:"currentGoalVal") as? Float{
            self.currentGoalVal = currentGoalVal
        } else {
            self.currentGoalVal = 0
        }
    }
}
