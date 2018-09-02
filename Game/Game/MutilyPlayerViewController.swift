//
//  MutilyPlayerViewController.swift
//  Game
//
//  Created by Louis on 2018/7/26.
//  Copyright © 2018年 Louis Aeilot D. All rights reserved.
//

import UIKit

class GameData {
    var score = 0
    var total = 0
    var tempscore = 0
    func play(){
        let score = Int(arc4random()%1000)
        self.total = self.total + score
        tempscore = score
    }
    
}
var PlayerOne = GameData()
var PlayerTwo = GameData()
class MutilyGameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var TotalTwo: UILabel!
    @IBOutlet weak var TotalOne: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBAction func PlayOne(_ sender: UIButton) {
        PlayerOne.play()
        Label.text = "分数: " + String(PlayerOne.tempscore)
        TotalOne.text = "总分: " + String(PlayerOne.total)
    }
    @IBAction func PlayTwo(_ sender: UIButton) {
        PlayerTwo.play()
        LabelTwo.text = "分数: " + String(PlayerTwo.tempscore)
        TotalTwo.text = "总分: " + String(PlayerTwo.total)
    }
    @IBAction func Clicked(_ sender: UIButton) {
        PlayerOne.score = 0
        PlayerOne.total = 0
        PlayerTwo.score = 0
        PlayerTwo.total = 0
    }
}
