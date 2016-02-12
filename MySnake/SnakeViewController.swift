//
//  ViewController.swift
//  MySnake
//
//  Created by littlersmall on 16/2/4.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class SnakeViewController: UIViewController {
    var timer: NSTimer!
    var food: Food!
    var snake: Snake!
    var isPause = false
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background")!
        
        view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        //初始化food
        food = Food(view: view)
        snake = Snake(view: view)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("walk"), userInfo: nil, repeats: true)
    }
    
    func walk() {
        if food.frame.origin == snake.head.frame.origin {
            food.changeFood(food)
            snake.eat()
            score += 10
            navigationItem.title = String(score)
        }
        
        snake.walk()
    }
    
    @IBAction func pause(sender: UIBarButtonItem) {
        isPause = !isPause
            
        if (isPause) {
            sender.title = "开始"
            timer.fireDate = NSDate.distantFuture()
        } else {
            sender.title = "暂停"
            timer.fireDate = NSDate.distantPast()
        }
    }
    
    @IBAction func changeDirection(sender: UITapGestureRecognizer) {
        let tapPoint = sender.locationInView(self.view)
        
        snake.changeDirection(tapPoint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

