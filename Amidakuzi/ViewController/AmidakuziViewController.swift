//
//  AmidakuziViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/22.
//

import UIKit

class AmidakuziViewController: UIViewController {
    
    var startItems: [String] = ["ごはん", "うどん"]
    var goalItems: [String] = []
    
    // 縦線の開始位置
    let startX: CGFloat = 50
    let startY: CGFloat = 100
    let endY: CGFloat = 500
    
    // 線の幅と色
    let lineWidth: CGFloat = 5
    let lineColor: UIColor = .black
    
    // 乱数生成器
    var random: RandomNumberGenerator = SystemRandomNumberGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lineView = LineView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height),
                                startPoint: CGPoint(x: 50, y: 100), endPoint: CGPoint(x: 50, y: 400))
        view.addSubview(lineView)
    }
    
}

class LineView: UIView {
    let startPoint: CGPoint
    let endPoint: CGPoint
    
    init(frame: CGRect, startPoint: CGPoint, endPoint: CGPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        UIColor.white.setFill()
        UIRectFill(rect)
        // 描画コンテキストを取得する
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // 線の属性を設定する
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.black.cgColor)
        
        // 線を描画する
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.strokePath()
    }
}





