//
//  LogInViewController.swift
//  Game
//
//  Created by Louis on 2018/7/25.
//  Copyright © 2018年 Louis Aeilot D. All rights reserved.
//


import UIKit

class LogInData {
    var UserName : String
    var Password : Int
    var score = 0
    var total = 0
    var tempscore = 0
    static var highestScore = 0
    init(UserName : String , Password : Int){
        self.UserName = UserName
        self.Password = Password
    }
    func play(){
        let score = Int(arc4random()%100)
        print("\(score)")
        
        self.total += score
        tempscore = score
        print("Total score is \(self.total).")
        
        if self.total > LogInData.highestScore{
            LogInData.highestScore = self.total
        }
        print("Highest score is \(LogInData.highestScore).\n")
    }

}
var temp : LogInData = LogInData(UserName: "", Password: 0)
var Louis : LogInData = LogInData(UserName: "Louis", Password: 0313)
var Administrator : LogInData = LogInData(UserName: "Admin", Password: 123456)

var isLouis = false
var isAdmin = false
class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var isLoggedIn : Bool = false
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var UserName: UITextField!
    @IBAction func isClicked(_ sender: UIButton) {
        if Password.text == nil || UserName.text == nil {
            Label.textColor = UIColor.red
            Label.text = "未输入"
            isLoggedIn = false
        }
        else if Password.text == String(Louis.Password) && UserName.text == Louis.UserName {
            Label.textColor = UIColor.black
            Label.text = "你好，Louis"
            isLoggedIn = true
            isLouis = true
            
        }
        else if Password.text == String(Administrator.Password) && UserName.text == Administrator.UserName {
            Label.textColor = UIColor.black
            Label.text = "你好，Administrator"
            isLoggedIn = true
            isAdmin = true
        }
        else{
            Label.textColor = UIColor.red
            Label.text = "未找到此账号"
            isLoggedIn = false
        }
    }
}

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if isLouis {
            Label.text = "你好，Louis"
        }
        else if isAdmin {
            Label.text = "你好，Administrator"
        }
        else
        {
            Label.text = "你好，客人"
        }
    }
    @IBOutlet weak var Total: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var HighestScore: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBAction func isClicked(_ sender: UIButton) {
        if isLouis {
            Louis.play()
            Score.text = "分数: " + String(Louis.tempscore)
            HighestScore.text = "最高总分: " + String(LogInData.highestScore)
            Total.text = "总分: " + String(Louis.total)
        }
        else if isAdmin {
            Administrator.play()
            Score.text = "分数: " + String(Administrator.tempscore)
            HighestScore.text = "最高总分: " + String(LogInData.highestScore)
            Total.text = "总分: " + String(Administrator.total)
        }
        else
        {
            temp.play()
            Score.text = "分数: " + String(temp.tempscore)
            Total.text = "总分: " + String(temp.total)
            HighestScore.text = "最高总分: " + String(LogInData.highestScore)
        }
    }

    @IBAction func Clicked(_ sender: UIButton) {
        if isLouis {
            Louis.score = 0
            Louis.total = 0
        }
        else if isAdmin {
            Administrator.score = 0
            Administrator.total = 0
        }
        else
        {
            temp.score = 0
            temp.total = 0
        }
        isLouis = false
        isAdmin = false
        Label.text = "已退出"
    }
    
}



