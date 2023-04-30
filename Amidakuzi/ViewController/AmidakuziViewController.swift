//
//  AmidakuziViewController.swift
//  Amidakuzi
//
//  Created by Kazuki Omori on 2023/04/22.
//

import UIKit

class AmidakuziViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var startItems: [String] = []
    var goalItems: [String] = []
    var linePoints: [CGPoint] = []
    var circleViews = [UIView]()
    // 縦線の開始位置
    var startX: Int = 50
    
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
            startX += 70
        }
        let lineView = LineView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.width * 3,
                                              height: view.frame.height),
                                linePoints: linePoints)
        
        self.scrollView.addSubview(lineView)
        let circlesView = CirclesView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: view.frame.width * 3,
                                                    height: view.frame.height),
                                      circleCount: goalItems.count)
        circlesView.frame = view.bounds
        self.scrollView.addSubview(circlesView)
        // 直線の数だけUITextFieldを生成してLineViewの上に配置する
        //        for i in 0..<linePoints.count {
        //            var startTFX = 30
        //            let textField = UITextField(frame: CGRect(x: startTFX, y: 100, width: 60, height: 20))
        //            textField.placeholder = "Enter text"
        //            textField.borderStyle = .roundedRect
        //            view.addSubview(textField)
        //            startTFX += 100
        //        }
        
    }
    
}

class CirclesView: UIView {
    
    let circleCount: Int
    var colors:[UIColor] = [.red(), .blue(), .yellow(), .purple(), .green(), .pink(), .lightBlue(), .yellowGreen(), .orange(), .gray(), .black(), .white()]
    let circleSpacing: CGFloat = 50
    let circleSize = CGSize(width: 50, height: 50)
    var x = 25
    
    init(frame: CGRect, circleCount: Int) {
        self.circleCount = circleCount
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.circleCount = 1
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        for i in 0..<circleCount {
            let circleView = UIView()
            circleView.backgroundColor = colors[i]
            circleView.frame = CGRect(x: x, y: 0, width: 50, height: 50)
            circleView.layer.cornerRadius = 25
            circleView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(circleView)
//            NSLayoutConstraint.activate([
//                circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                circleView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: CGFloat(i - 1) * circleSpacing),
//                circleView.widthAnchor.constraint(equalToConstant: circleSize.width),
//                circleView.heightAnchor.constraint(equalToConstant: circleSize.height)
//                        ])
            x += 70
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
            context.move(to: CGPoint(x: point.x, y: 50))
            context.addLine(to: CGPoint(x: point.x, y: 400))
            context.strokePath()
        }
    }
}





