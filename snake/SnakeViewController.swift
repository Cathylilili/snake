//
//  ViewController.swift
//  snake
//
//  Created by littlersmall on 16/1/23.
//  Copyright © 2016年 littlersmall. All rights reserved.
//

import UIKit

class SnakeViewController: UIViewController {
    var timer: NSTimer!
    var snake: Snake!
    var food: Food!
    var isPause = false
    var score = 0
    
    @IBAction func leftBarButtonItemTouch(sender: UIBarButtonItem) {
        isPause = !isPause
        
        if (isPause) {
            sender.title = "开始"
            timer.fireDate = NSDate.distantFuture()
        } else {
            sender.title = "暂停"
            timer.fireDate = NSDate.distantPast()
        }
    }
    
    @IBAction func chooseDirection(sender: UITapGestureRecognizer) {
        let tapPoint = sender.locationInView(self.view)
        
        snake.changeDirection(tapPoint)
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background")!
        
        view.backgroundColor = UIColor(patternImage: backgroundImage)
        
        food = Food(view: view)
        snake = Snake(view: view)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("walk"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

