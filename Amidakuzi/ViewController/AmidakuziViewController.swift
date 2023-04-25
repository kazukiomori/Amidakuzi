//
//  AmidakuziViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/22.
//

import UIKit

class AmidakuziViewController: UIViewController {
    
    var startItems: [String] = []
    var goalItems: [String] = []
    var colors:[UIColor] = [.red(), .blue(), .yellow(), .purple(), .green(), .pink(), .lightBlue(), .yellowGreen(), .orange(), .gray(), .black(), .white()]
    var linePoints: [CGPoint] = []
    // 縦線の開始位置
    var startX: Int = 50
    var startY: Int = 100
    var endY: Int = 600
    
    // 線の幅と色
    let lineWidth: CGFloat = 5
    let lineColor: UIColor = .black
    
    // 乱数生成器
    var random: RandomNumberGenerator = SystemRandomNumberGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1..<goalItems.count + 1 {
            let x = CGFloat(startX)
            let y = CGFloat(0)
            let point = CGPoint(x: x, y: y)
            linePoints.append(point)
            startX += 100
        }
        let lineView = LineView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height),
                                linePoints: linePoints)
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height))
        scrollView.contentSize = lineView.frame.size // LineViewのframeサイズをcontentSizeに設定する
        scrollView.addSubview(lineView)
        
        // UIScrollViewの横方向のスクロールを有効にする
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        view.addSubview(scrollView)
        // 直線の数だけUITextFieldを生成してLineViewの上に配置する
        for i in 0..<linePoints.count {
            var startTFX = 30
            let textField = UITextField(frame: CGRect(x: startTFX, y: 100, width: 60, height: 20))
            textField.placeholder = "Enter text"
            textField.borderStyle = .roundedRect
            view.addSubview(textField)
            startTFX += 100
        }
        
    }
    
}

class LineView: UIView {
    let linePoints: [CGPoint]
    
    init(frame: CGRect, linePoints: [CGPoint]) {
        self.linePoints = linePoints
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
        for point in linePoints {
            context.move(to: CGPoint(x: point.x, y: 100))
            context.addLine(to: CGPoint(x: point.x, y: 400))
            context.strokePath()
        }
    }
}





