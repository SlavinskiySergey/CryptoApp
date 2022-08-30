//
//  LightTheme.swift
//  Components
//

import UIKit

struct LightTheme: Theme {
    let name = "Light"
    
    let statusBarStyle: UIStatusBarStyle = .darkContent

    let effect: UIVisualEffect = UIBlurEffect(style: .extraLight)

    let colors: [ColorKey : UIColor] = [
        .backgroundContent: .hex(0xfefefe),
        .backgroundPage: .hex(0xefeff3),
        .tint: .black,
        .captionColor: .hex(0x8E8E93),
        .actionColor: .hex(0x367cde),
        .arrowColor: .hex(0xcad2db),
        .deselectedColor: .hex(0xf6f8fa).withAlphaComponent(0.8),
        .dateColor: .hex(0x6d6d72),
        .yColor: .hex(0x252529).withAlphaComponent(0.5),
        .chartLine: .hex(0x182d3b).withAlphaComponent(0.1),
        .separator: .hex(0xc8c7cc),
        .maskColor: .hex(0xfefefe).withAlphaComponent(0.8),
        .titleColor: .darkGray
    ]
}
