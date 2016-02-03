//
//  Snake.swift
//  snake
//
//  Created by littlersmall on 16/1/24.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class Snake {
    let head = SnakeHead()
    let body = SnakeBody()
    var direction = Direction.RIGHT
    weak var mainView: UIView!
    
    init(view: UIView) {
        mainView = view
        head.nextItem = body.getFirst()
        
        
        view.addSubview(head)
        body.addBody(view)
    }
    
    
    func walk() {
        direction.walk(&head.frame)
        head.touchEdge()
    }
    
    func eat() {
        body.addOne(mainView)
    }
    
    func changeDirection(point: CGPoint) {
        direction.changeDirection(head.frame.origin, target: point)
    }
}

extension Direction {
    func walk(inout frame: CGRect) {
        switch self {
        case .UP: frame.origin.y -= CGFloat(Constants.sideLength)
        case .DOWN: frame.origin.y += CGFloat(Constants.sideLength)
        case .LEFT: frame.origin.x -= CGFloat(Constants.sideLength)
        case .RIGHT: frame.origin.x += CGFloat(Constants.sideLength)
        }
    }
    
    mutating func changeDirection(cur: CGPoint, target: CGPoint) {
        switch self {
        case .UP: self = cur.x > target.x ? .LEFT : .RIGHT
        case .DOWN: self = cur.x > target.x ? .LEFT : .RIGHT
        case .LEFT: self = cur.y > target.y ? .UP : .DOWN
        case .RIGHT: self = cur.y > target.y ? .UP : .DOWN
        }
    }
}
