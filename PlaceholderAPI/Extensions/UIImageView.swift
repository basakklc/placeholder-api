//
//  UIImageView.swift
//  PlaceholderAPI
//
//  Created by Nuevo Intern1 on 20.01.2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(url: String) {
        let url = URL(string: url)
        do{
            if let url = url {
                let imageData = try Data(contentsOf: url)
                if let image = UIImage(data: imageData) { self.image=image }
            }
        }catch{
            print("err")
        }
    }
}
