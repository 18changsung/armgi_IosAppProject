//
//  DataCenter.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()

class DataCenter{

    var studyList:[String]
    var ddayList:[Int]
    var goalData:GoalData
    var unitList:[OneUnit]
    var starList:[Words]
    var templateColor:[String]
    var selectedColor:[Int]

    init(){
        self.studyList = []
        self.ddayList = []
        self.goalData = GoalData(currentGoalVal: 0)
        self.unitList = []
        self.starList = []
        self.templateColor = ["#60ADED","#8EFA00","#FFFB00","#FF2600"]
        self.selectedColor = []
        //순서대로 파란색,초록색,노란색,빨간색
    }
}

class GoalData {
    var goalList:[Float]
    var currentGoalVal:Float

    init(currentGoalVal:Float) {
        self.goalList = []
        self.currentGoalVal = currentGoalVal
    }
}

class OneUnit {
    var unitName:String?
    var allWords:[Words]
    var allSentences:[String]

    init(unitName:String) {
        self.unitName = unitName
        self.allWords = []
        self.allSentences = []
    }
}

class Words { //단어들
    var keyword:String
    var explanation:String
    var starFlag:Bool
    var starImageFlag:Bool

    init(keyword:String, explanation:String) {
        self.keyword = keyword
        self.explanation = explanation
        self.starFlag = false
        self.starImageFlag = false
    }

}

//optional로 처리 안해도 될까? 처리하면 append가 안되는데?
