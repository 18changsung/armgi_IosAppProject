//
//  AddTableViewController.swift
//  Armgi_Main
//
//  Created by Tars on 7/26/18.
//  Copyright © 2018 sspog. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var inputSubject: UITextField!

    @IBOutlet weak var inputTest: UITextField!

    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    var count:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    @IBAction func modalDismiss(_ sender: Any) {
        var inputStudy:String = "none"
        if let input1 = inputSubject.text, let input2 = inputTest.text{
            inputStudy = input1 + " " + input2
        }
        studyData.studyList.append(inputStudy)
        /*
        if var list = studyData.studyList{
            list.append(inputStudy)
        }
         */
        //과목, 시험 텍스트필드에 입력된 값을 합쳐서 리스트에 추가.
        print(studyData.studyList) //확인.

        /* Presenting 관계를 이용.
        switch self.presentingViewController {
        case let tabBarC as UITabBarController:
            if let navigationC = tabBarC.selectedViewController as? UINavigationController, let MainTableVC = navigationC.topViewController as? MainTableViewController{
                MainTableVC.addNewItem(studyData.studyList, ddayData.ddayList)
            }
        case let navigationC as UINavigationController:
            if let MainTableVC = navigationC.topViewController as? MainTableViewController{
                MainTableVC.addNewItem(studyData.studyList, ddayData.ddayList)
            }
        case let MainTableVC as MainTableViewController:
                MainTableVC.addNewItem(studyData.studyList, ddayData.ddayList)
        default:
            break
        }
        */

        self.dismiss(animated: true, completion: nil)
    }
    //완료 버튼으로 모달창 닫기.

    @IBAction func modalCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //취소 버튼으로 모달창 닫기.
*/

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindDone"{
            guard let MainTableVC = segue.destination as? MainTableViewController else{
                return
            }
            var addStudy:String = "none"
            if let input1 = inputSubject.text, let input2 = inputTest.text{
                addStudy = input1 + " " + input2
            }
            count += 1
            MainTableVC.addNewItem(studyAdd: addStudy, ddayAdd: count)
        }
    }


    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
