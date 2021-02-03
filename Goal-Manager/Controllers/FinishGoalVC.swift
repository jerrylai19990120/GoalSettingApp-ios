//
//  FinishGoalVC.swift
//  Goal-Manager
//
//  Created by Jerry Lai on 2021-02-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

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
        
    }
    
    
    

}
