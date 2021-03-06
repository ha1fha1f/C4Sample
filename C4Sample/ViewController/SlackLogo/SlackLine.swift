//
//  SlackLine.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/27.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class SlackLine: View {
    var line: Line!
    
    var strokeColor: Color = C4Blue {
        didSet {
            line.strokeColor = strokeColor
        }
    }
    
    private var seq: ViewAnimationSequence!
    
    init(size: Double) {
        super.init()
        self.frame = Rect(0, 0, size, size * 9.0/53.0)
        line = Line(Point(height/2.0, height/2.0), Point(width-height/2.0, height/2.0))
        line.lineWidth = height
        add(line)
        
        createAnimation()
    }
    
    private func createAnimation() {
        // 書き出しの点だけにする
        let strokeOut = ViewAnimation(duration: 0.25) {
            self.line.strokeEnd = 0.01
        }
        strokeOut.curve = .EaseOut
        strokeOut.delay = 0.1
        
        // 書き終わりの点だけにする
        let shiftStroke = ViewAnimation(duration: 0.25) {
            self.line.strokeStart = 0.99
            self.line.strokeEnd = 1.0
        }
        shiftStroke.delay = 0.35
        shiftStroke.curve = .EaseIn
        
        // やや縮小
        let strokeIn = ViewAnimation(duration: 0.15) {
            self.line.lineWidth -= 1
            self.line.strokeStart = 0.05
            self.line.transform.scale(1/1.05, 1.0)
        }
        strokeIn.delay = 0.2
        
        // 元通りに
        let bounceOut = ViewAnimation(duration: 0.15) {
            self.line.transform.scale(1.05, 1.0)
            self.line.lineWidth += 1
            self.line.strokeStart = 0.0
        }
        seq = ViewAnimationSequence(animations: [strokeOut, shiftStroke, strokeIn, bounceOut])
    }
    
    func animate() {
        seq.animate()
    }
}
