//
//  CustomColor.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 21/05/23.
//

import Foundation
import ChameleonFramework

struct CustomColor{
    let pink: UIColor!
    init(withFrame: CGRect) {
       let firstColor = UIColor(hexString: "FFC0CB", withAlpha: 1)
       let secondColor = UIColor(hexString: "FF6322", withAlpha: 1)
        pink = UIColor(gradientStyle: .leftToRight, withFrame: withFrame, andColors: [firstColor!, secondColor!])
    }
    func getPinkColor() -> UIColor{
        return pink
    }
}
