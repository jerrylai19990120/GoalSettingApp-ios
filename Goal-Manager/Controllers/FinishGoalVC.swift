//
//  FinishGoalVC.swift
//  Goal-Manager
//
//  Created by Jerry Lai on 2021-02-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit
import  CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var pointTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    var goalDes: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtn.bindToKeyboard()
        pointTxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func initData(description: String, type: GoalType){
        self.goalDes = description
        self.goalType = type
    }

    @IBAction func createGoalPressed(_ sender: Any) {
        if pointTxt.text != "" {
            self.save { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: @escaping (_ status: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDes
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTxt.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            debugPrint("\(error.localizedDescription)")
        }
    }

}
