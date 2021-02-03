//
//  CreateGoalVC.swift
//  Goal-Manager
//
//  Created by Jerry Lai on 2021-02-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {
    
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        // Do any additional setup after loading the view.
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
    }
    

    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            
            finishGoalVC.initData(description: goalTextView.text, type: goalType)
            
            finishGoalVC.modalPresentationStyle = .fullScreen
            
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
            
        }
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
