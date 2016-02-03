//
//  Food.swift
//  snake
//
//  Created by littlersmall on 16/1/23.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class Food: UIButton {
    let foodWidth = Constants.sideLength
    let foodHeight = Constants.sideLength
    let x = Constants.width
    let y = Constants.height
    
    init(view: UIView) {
        //初始化在屏幕中央
        super.init(frame: CGRect(x: 180, y: 330, width: foodWidth, height: foodHeight))
        setImage(randomImage(), forState: .Normal)
        layer.cornerRadius = CGFloat(Constants.sideLength/2)
        clipsToBounds = true
        addTarget(self, action: "changeFood:", forControlEvents: .TouchDown)
        
        view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeFood(button: UIButton) {
        setImage(randomImage(), forState: .Normal)
        setImage(randomImage(), forState: .Selected)
        setImage(randomImage(), forState: .Highlighted)
        frame = randomPos()
    }
    
    
    func randomPos() -> CGRect {
        func round(value: Int) -> Int {
            return (value/Constants.sideLength) * Constants.sideLength
        }
        
        let curX = round(Int(arc4random_uniform(UInt32(x))))
        let curY = round(60 + Int(arc4random_uniform(UInt32(y))))
        
        print(curX, curY)
        
        return CGRect(x: curX, y: curY, width: foodWidth, height: foodHeight)
    }
    
    func randomImage() -> UIImage {
        let foods = ["sausage", "rice", "cake", "chicken", "wine"]
        let rand = Int(arc4random_uniform(3))
        
        return UIImage(named: foods[rand])!
    }
}
