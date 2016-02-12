//
//  Food.swift
//  MySnake
//
//  Created by littlersmall on 16/2/4.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class Food: UIButton {
    let foodX = 30
    let foodY = 30
    let screenX = 345
    let screenY = 570
    
    init(view: UIView) {
        //初始化在屏幕中央
        super.init(frame: CGRect(x: 180, y: 330, width: foodX, height: foodY))
        
        setImage(UIImage(named: "chicken"), forState: .Normal)
        layer.cornerRadius = CGFloat(foodX/2)
        clipsToBounds = true

        //将Food添加到主view中显示
        view.addSubview(self)
        //注册点击事件
        addTarget(self, action: "changeFood:", forControlEvents: .TouchDown)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeFood(button: UIButton) {
        button.frame.origin = randomPos()
    }
    
    func randomNum(num: Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    func randomPos() -> CGPoint {
        //对产生的随机数按食物大小取整，方便后面蛇的吃食操作
        func round(value: Int) -> Int {
            return (value/foodX) * foodX
        }
        
        let curX = round(randomNum(screenX))
        let curY = round(60 + randomNum(screenY)) //60为屏幕的导航栏
        
        
        return CGPoint(x: curX, y: curY)
    }
}
