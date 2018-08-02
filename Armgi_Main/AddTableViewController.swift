//
//  AddTableViewController.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    //목표량 바 색상 선택
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCenter.templateColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath)

        cell.backgroundColor = UIColor().colorFromHex(dataCenter.templateColor[indexPath.row])
        return cell

    }

    @IBOutlet weak var studyTitleInput: UITextField!

    @IBOutlet weak var endDatePicker: UIDatePicker! //pickerView로 선택한 마감날짜.

    @IBOutlet weak var goalValueLabel: UILabel!

    @IBOutlet weak var stepperValue: UIStepper!

    @IBAction func stepperAction(_ sender: Any) {
        goalValueLabel.text = "\(Int(stepperValue.value))"
    }

    var count:Int = 0

    //텍스트 필드 공백시 알림
    let inputAlert = UIAlertController(title:"어이쿠!", message:"학습 주제나 목표량이 제대로 입력되었는지\r\n확인해주세요!", preferredStyle: .alert)
    let inputAlertAction = UIAlertAction(title:"확인", style: .default, handler: nil)
    @objc func dismissFunc(){
        self.inputAlert.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

        // 홈 버튼을 누르고 돌아오면 오류메시지 안보이기.
        inputAlert.addAction(inputAlertAction)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(dismissFunc), name: Notification.Name.UIApplicationWillResignActive, object: nil)

        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneDismiss(_ sender: Any) {
        if let studyTitleInput = studyTitleInput.text{
            if studyTitleInput == "" || Int(stepperValue.value) == 0{
                self.present(inputAlert, animated: true, completion: nil)
            }else{
                dataCenter.studyList.append(studyTitleInput)
                dataCenter.ddayList.append(findDday())
                dataCenter.goalData.goalList.append(Float(stepperValue.value))
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    //완료 버튼으로 모달창 닫기.

    @IBAction func cancelDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //취소 버튼으로 모달창 닫기.

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    //키보드 완료 버튼 누르면 키보드 숨기기.

/*
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     self.view.endEditing(true)
     }
     //주변 터치하면 키보드 숨기기.
*/

    //Dday를 구해주는 함수
     func findDday() -> Int{
        let todayDate = Date()
        do {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.day]
            formatter.unitsStyle = .full //필요.
            if let daysString = formatter.string(from: todayDate, to: endDatePicker.date) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .none
                let startDate = dateFormatter.string(from: todayDate)
                let endDate = dateFormatter.string(from: endDatePicker.date)
                if startDate == endDate{
                    return 0
                }
                let ddayArr = daysString.components(separatedBy: " ")
                if let ddayIndexZero = Int(ddayArr[0].components(separatedBy: [","]).joined()){
                    if ddayIndexZero < 0{
                        return ddayIndexZero
                    }
                    else{
                        return ddayIndexZero + 1
                    }
                }
            }
        }
        return 9999
    }

/*
    // unwind
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindDone"{
            guard let MainTableVC = segue.destination as? MainTableViewController else{
                return
            }
            MainTableVC.addNewItem(studyAdd: addStudy, ddayAdd: findDday())
        }
    }
*/

    // MARK: - Table view data source

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
