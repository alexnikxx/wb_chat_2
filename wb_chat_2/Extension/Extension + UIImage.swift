//
//  Extension + UIImage.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 15.08.2024.
//

import SwiftUI

extension UIImage {
    func convertToBase64String() -> String? {
        guard let imageData = self.jpegData(compressionQuality: 0.8) else { return nil }
        return imageData.base64EncodedString()
    }
}
