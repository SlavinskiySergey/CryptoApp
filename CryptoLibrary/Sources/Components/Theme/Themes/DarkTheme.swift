//
//  DarkTheme.swift
//  Components
//

import UIKit

struct DarkTheme: Theme {
    let name = "Dark"
    
    let statusBarStyle: UIStatusBarStyle = .lightContent

    let effect: UIVisualEffect = UIBlurEffect(style: .dark)

    let colors: [ColorKey : UIColor] = [
        .backgroundContent: .hex(0x242f3e),
        .backgroundPage: .hex(0x1a222c),
        .tint: .white,
        .captionColor: .hex(0x8596ab),
        .actionColor: .hex(0x448ff7),
        .arrowColor: .hex(0x384657),
        .deselectedColor: .hex(0x1f2a39).withAlphaComponent(0.8),
        .dateColor: .hex(0xf7f7f7),
        .chartLine: .hex(0xffffff).withAlphaComponent(0.1),
        .maskColor: .hex(0x242f3e).withAlphaComponent(0.5),
        .separator: .hex(0x131a23),
        .yColor: .hex(0xf7f7f7).withAlphaComponent(0.9),
        .titleColor: .lightGray
    ]
}
