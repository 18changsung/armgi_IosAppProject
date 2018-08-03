//
//  MainTableViewController.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var ddayLabel: UILabel! //DdayLabel

    @IBOutlet weak var goalStateBar: UIView!

    @IBOutlet weak var goalStateLabel: UILabel!
    
    @IBOutlet weak var starImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class MainTableViewController: UITableViewController {

/*
    // 상단의 수정 bar button 으로 삭제하기.
    @IBAction func editList(_ sender: Any) {
        guard !dataCenter.studyList.isEmpty else{
            return
        }
        self.setEditing(true, animated: true)
    }
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return dataCenter.studyList.count
        
        /*
        guard let rowCount = dataCenter.studyList else{
            return 0
        }
        return rowCount.count
        */
        /*
        let returnRow:Int
        if let rowCount = dataCenter.studyList{
            returnRow = rowCount.count
        }
        return returnRow
        //DataCenter에서 studyList를 optional로 처리하면, Binding작업이 무한 반복됨.
        */
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    //Dday 출력형식 정의
    func ddayReturn(indexPathSection:Int) -> String{
        switch dataCenter.ddayList[indexPathSection] {
        case 0:
            return "D - Day"
        case ..<0:
            return "Dday가 이미 지났습니다."
        default:
            return "D - " + String(dataCenter.ddayList[indexPathSection])
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studyCell", for: indexPath)
        
        // Configure the cell...

        guard let studyCell = cell as? MainTableViewCell else{
            return cell
        }
        studyCell.ddayLabel.text = ddayReturn(indexPathSection: indexPath.section)
        studyCell.goalStateBar.backgroundColor = UIColor().colorFromHex(dataCenter.templateColor[dataCenter.selectedColor[indexPath.section]])

        let goalVal = dataCenter.goalData.currentGoalVal/dataCenter.goalData.goalList[indexPath.section]
        if goalVal <= 1.0{
            studyCell.goalStateBar.frame.size.width = CGFloat(goalVal*343)
            //아이폰 사이즈에 따라 343이 아닐 수도 있음.
            //let cellWidth = ((UIScreen.mainScreen().bounds.width) — 32–30 ) / 3

            studyCell.goalStateLabel.text = String(Int(goalVal*100)) + "%"
            if goalVal == 1.0{
                studyCell.starImage.image = UIImage(named: "goalStar")
            }else{
                studyCell.starImage.image = nil
            }
            print(goalVal)

            dataCenter.collectionViewCellCurrent = 0 //다시 파란색으로 초기화.
        }
        return studyCell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?{

        return dataCenter.studyList[section]
        /*
        guard let header = dataCenter.studyList else{
            return "오류"
        }
        return header[section]
         */
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.


    // 테이블 section 삭제 및 studyList, ddayList 배열에서 제거.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        // 제거할 때 한 번 더물어보기.
        let deleteAlert = UIAlertController(title:"정말?", message:"학습 목표를 삭제하시겠습니까?\r\n삭제시 복구가 불가능합니다.", preferredStyle: .alert)
        let deleteOk = UIAlertAction(title:"확인", style: .destructive) { (action : UIAlertAction) in
            //Cell에 존재하는 모든 데이터들을 같이 삭제해주어야 한다.
            dataCenter.studyList.remove(at: indexPath.section)
            dataCenter.ddayList.remove(at: indexPath.section)
            dataCenter.goalData.goalList.remove(at: indexPath.section)


            // Delete the row from the data source
            let indexSet = IndexSet(arrayLiteral: indexPath.section)
            tableView.deleteSections(indexSet, with: .automatic)
        }
        let deleteCancel = UIAlertAction(title:"취소", style: .cancel, handler:nil)
        deleteAlert.addAction(deleteOk)
        deleteAlert.addAction(deleteCancel)
        self.present(deleteAlert, animated: true, completion: nil)
    }

    //delete를 한글로 바꾸기.
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
