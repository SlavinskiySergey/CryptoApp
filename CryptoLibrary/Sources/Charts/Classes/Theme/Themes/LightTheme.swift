//
//  LightTheme.swift
//  Charts
//

import UIKit

struct LightTheme: Theme {
    let name = "Day"

    let effect: UIVisualEffect = UIBlurEffect(style: .extraLight)

    let colors: [ColorKey : UIColor] = [
        .backgroundContent: .hex(0xfefefe),
        .tint: .black,
        .captionColor: .hex(0x8E8E93),
        .arrowColor: .hex(0xcad2db),
        .deselectedColor: .hex(0xf6f8fa).withAlphaComponent(0.8),
        .dateColor: .hex(0x6d6d72),
        .yColor: .hex(0x252529).withAlphaComponent(0.5),
        .chartLine: .hex(0x182d3b).withAlphaComponent(0.1),
        .maskColor: .hex(0xfefefe).withAlphaComponent(0.8)
    ]
}
