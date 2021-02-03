//
//  UIButtonExt.swift
//  Goal-Manager
//
//  Created by Jerry Lai on 2021-02-02.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3875081784, green: 1, blue: 0.7630689706, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.7607393869, green: 1, blue: 0.8967984825, alpha: 1)
    }
    
}
