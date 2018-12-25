//
//  ResultViewController.swift
//  swift-Basic
//
//  Created by nsuhara on 2018/11/16.
//  Copyright © 2018 nsuhara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var textName: String = ""
    var intCount: Int = 0
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelButtonGetResult: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.labelResult.layer.cornerRadius = self.labelResult.bounds.width / 10
        self.labelResult.layer.masksToBounds = true
        self.labelName.text = "\(self.textName) さん..."
        self.intCount = 0
        updateLabal()
    }

    func updateLabal() {
        let result = [
            "あれ?髪を切った?前も良かったけど、それも似合うね",
            "肌がキレイになってない?赤ちゃん肌やん!",
            "メイク変えた?うそ!?変えてないの?大人っぽくなった気がする",
            "今日は雰囲気違う?何かキレイ",
            "かわいいバッグだね、センスいいよね",
            "足が細いから何を着ても素敵ね",
            "まるで声優みたいにいい声してるね",
            "素敵な笑顔だね!輝いてるよ",
            "かわいい!ホント素敵な笑顔だね",
            "めっちゃエクボがかわいい!",
            "ぼくのお姫様にしたい",
            "絶対にモテるでしょ!",
            "瞳が綺麗だね!吸い込まれそうだよ",
            "子どもがいるの?うそー!信じられない",
            "肌が綺麗ですね!20代にしか見えない",
            "やせたね!一段と綺麗になったよ",
            "優しいよね!旦那さんがうらやましいよ",
            "料理もダンスもできるんだ!器用だよね",
            "君のおかげだよ。心から感謝してるよ"
        ]

        let random = Int(arc4random_uniform(UInt32(result.count)))
        self.labelResult.text = result[random]
        self.intCount += 1

        if random % 7 == 0 {
            self.labelButtonGetResult.setTitle("(´∀｀・)ﾊｧﾊｧ", for: .normal)
        } else {
            switch self.intCount {
            case 0...10:
                self.labelButtonGetResult.setTitle("おかわり!", for: .normal)
            case 11...15:
                self.labelButtonGetResult.setTitle("ちょっと、、、", for: .normal)
            case 16...20:
                self.labelButtonGetResult.setTitle("お腹いっぱい。。。", for: .normal)
            case let count where count > 20:
                self.labelButtonGetResult.setTitle("もうええやろ(｀Д´#)", for: .normal)
            default:
                break
            }
        }
    }

    @IBAction func buttonGetResult(_ sender: Any) {
        updateLabal()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
