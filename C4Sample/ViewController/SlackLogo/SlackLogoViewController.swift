//
//  SlackLogoViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/27.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

// http://c4ios.com/tutorials/slack-logo/
// 半透明使わないところまで
class SlackLogoViewController: CanvasController {
    
    override func setup() {
        let sl = SlackLogo(size: 106)
        sl.center = canvas.center
        canvas.add(sl)

        canvas.addTapGestureRecognizer { locations, center, state in
            sl.animate()
        }
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
}
