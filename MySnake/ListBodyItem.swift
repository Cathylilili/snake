//
//  ListBodyItem.swift
//  MySnake
//
//  Created by littlersmall on 16/2/6.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class ListBodyItem: UIButton {
    override var frame: CGRect {
        set {
            if let next = nextItem {
                next.frame.origin = frame.origin
            }
            
            super.frame.origin = newValue.origin
        }
        
        get {
            return super.frame
        }
    }
    
    var nextItem: ListBodyItem?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnakeHead: ListBodyItem {
    init() {
        super.init(frame: CGRect(x: 90, y: 90, width: 30, height: 30))
        setImage(UIImage(named: "snakeHead"), forState: .Normal)
        layer.cornerRadius = 17
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchEdge(){
        if (frame.origin.x < 0) {
            frame.origin.x = 330
        } else if (frame.origin.x > 330) {
            frame.origin.x = 0
        } else if (frame.origin.y < 60) {
            frame.origin.y = 630
        } else if (frame.origin.y > 630) {
            frame.origin.y = 60
        }
    }
}

class SnakeBody {
    var startRadius: CGFloat = 20.0
    var bodys = [ListBodyItem]()
    
    //初始化身体时只有一段
    init() {
        bodys.append(conBody(CGRect(x: 60, y: 90, width: 30, height: 30)))
    }
    
    //为蛇添加一段(完成一次吃食后调用)
    func addOne(view: UIView) {
        let curLast = bodys.last!
        
        bodys.append(conBody(curLast.frame))
        curLast.nextItem = bodys.last
        
        view.addSubview(bodys.last!)
    }
    
    //构造一个bodyItem
    func conBody(frame: CGRect) -> ListBodyItem {
        let body = ListBodyItem(frame: frame)
        body.setImage(UIImage(named: "snakeBody"), forState: .Normal)
        body.layer.cornerRadius = startRadius
        body.clipsToBounds = true
        startRadius += 0.5
        
        return body
    }
}