//
//  TileCollectionViewCell.swift
//  ScrabbleCheater
//
//  Created by Kelly O'Brien on 7/15/20.
//  Copyright © 2020 Kismet Development. All rights reserved.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {    
    @IBOutlet weak var tileLetterLabel: UILabel!
    @IBOutlet weak var tileValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        //tileLetterLabel.adjustFontSizeForDevice()
    }
}

//enum DeviceSize {
//    case big, medium, small
//}
//
//protocol Fontadjustable {
//
//    var devicetype: DeviceSize { get }
//
//    func adjustFontSizeForDevice()
//}
//
//extension UILabel: Fontadjustable {
//
//    var devicetype: DeviceSize {
//        switch UIScreen.main.nativeBounds.height {
//        case 736:
//            print("small")
//            return .small
//        case 1334:
//            print("medium")
//            return .medium
//        case 1920:
//            print("big1")
//            return .big
//        case 500...2208:
//            print("big2")
//            return .big
//        default:
//            print("default")
//            return .small
//        }
//    }
//
//    func adjustFontSizeForDevice() {
//        switch self.devicetype {
//        case .small:
//            self.font = font.withSize(font.pointSize)
//        case .medium:
//            self.font = font.withSize(font.pointSize + 80)
//        case .big:
//            self.font = font.withSize(font.pointSize + 80)
//        }
//    }
//}
