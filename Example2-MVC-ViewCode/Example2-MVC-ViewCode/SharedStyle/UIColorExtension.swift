//
//  UIColorExtension.swift
//  Example2-MVC-ViewCode
//
//  Created by Marcello Chuahy on 18/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

extension UIColor {
  
  struct CustomStyle {
    static var white: UIColor           { return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1) }
    static var whiteAlpha50: UIColor    { return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5) }
    static var backgroundGray: UIColor  { return UIColor(red: 238/255, green: 233/255, blue: 229/255, alpha: 1) }
    static var lightGray: UIColor       { return UIColor(red: 238/255, green: 233/255, blue: 229/255, alpha: 1) }
    static var gray: UIColor            { return UIColor(red:  96/255, green:  87/255, blue:  81/255, alpha: 1) }
    static var darkGray: UIColor        { return UIColor(red:  37/255, green:  34/255, blue:  32/255, alpha: 1) }
    static var yellow: UIColor          { return UIColor(red: 241/255, green: 174/255, blue:  47/255, alpha: 1) }
    static var purple: UIColor          { return UIColor(red: 120/255, green:  27/255, blue: 142/255, alpha: 1) }
    static var darkRed: UIColor         { return UIColor(red: 183/255, green:  28/255, blue:  28/255, alpha: 1) }
    static var lightOrange: UIColor     { return UIColor(red: 238/255, green: 132/255, blue:  42/255, alpha: 1) }
    static var orange: UIColor          { return UIColor(red: 238/255, green: 127/255, blue:  47/255, alpha: 1) }
  }
  
}
