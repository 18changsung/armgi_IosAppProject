//
//  DataCenter.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import Foundation

let studyData:StudyData = StudyData()
let ddayData:DdayData = DdayData()

class StudyData {
    var studyList:[String] //optional로 처리 안해도 될까? 처리하면 append가 안되는데?
    init() {
        self.studyList = []
    }
}

class DdayData {
    var ddayList:[Int]
    init() {
        self.ddayList = []
    }
}
