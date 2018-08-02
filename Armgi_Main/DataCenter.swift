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
    var templateColor:[String]

    init(){
        self.studyList = []
        self.ddayList = []
        self.goalData = GoalData(currentGoalVal: 0)
        self.templateColor = ["8EFA00","#60ADED","#FFFB00","FF2600"]
        //순서대로 초록색,파란색,노란색,빨간색
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

//optional로 처리 안해도 될까? 처리하면 append가 안되는데?
