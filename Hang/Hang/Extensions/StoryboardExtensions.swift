//
//  Extensions.swift
//  Hang
//
//  Created by Devfactori II on 8/8/20.
//  Copyright © 2020 Hang. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor ?? CGColor(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            layer.cornerRadius
        }
    }
}

extension UITextField {
    
//    var textPublisher: AnyPublisher<String, Never> {
//
//        NotificationCenter.Publisher(center: .default, name: UITextField.textDidChangeNotification, object: self)
//            .compactMap { $0.object as? UITextField }
//            .map { $0.text ?? "" }
//            .eraseToAnyPublisher()
//
//    }
//
//    func setState(isError: Bool, errorText: String? = nil, placeHolderText: String? = nil, isPlaceholderBlue: Bool = true) {
//
//        if isError {
//
//            if !(self.text?.isEmpty ?? true) {
//                self.textColor = .AxiaPurple1
//            } else {
//                self.placeholder = errorText
//                self.placeHolderColor = .AxiaPurple1
//            }
//            self.layer.borderColor = UIColor.AxiaPurple1.cgColor
//
//        } else {
//            self.placeholder = placeHolderText
//            self.textColor = .AxiaBlue1
//            self.layer.borderColor = UIColor.AxiaBlue3.cgColor
//
//            if isPlaceholderBlue {
//                self.placeHolderColor = .AxiaBlue1
//            } else {
//                self.placeHolderColor = .AxiaGrey1
//            }
//        }
//
//    }
    
    @IBInspectable var placeHolderColor : UIColor {
        set {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [
                    NSAttributedString.Key.foregroundColor : newValue
                    ]
                )
        }
        get {
            return self.placeHolderColor
        }
    }
    
    @IBInspectable var leftPadding : CGFloat {
        set {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: bounds.height))
            leftViewMode = .always
        }
        get {
            return leftView?.bounds.width ?? 0.0
        }
    }
    
    @IBInspectable var rightPadding : CGFloat {
        set {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: bounds.height))
            rightViewMode = .always
        }
        get {
            return rightView?.bounds.width ?? 0.0
        }
    }
    
    func setIcon(_ image: UIImage) {
        
        let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 11, width: 17, height: 15))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 10, y: 0, width: 34, height: 37))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
        
    }
    
    @objc func rightEyeBtn(_ sender: UIButton) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        if self.isSecureTextEntry {
            sender.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
        } else {
            sender.setImage(UIImage.init(systemName: "eye.fill"), for: .normal)
        }
    }
    
//    func setRightEyeIcon() {
//
//        let eyeBtn = UIButton(type: .system)
//        eyeBtn.tintColor = .AxiaBlue1
//        eyeBtn.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
//        eyeBtn.addTarget(self, action: #selector(rightEyeBtn), for: .touchUpInside)
//        eyeBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
//        eyeBtn.frame = CGRect(x: CGFloat(eyeBtn.frame.size.width - 25),
//                                 y: CGFloat(5),
//                                 width: CGFloat(25),
//                                 height: CGFloat(25))
//        self.rightView = eyeBtn
//        self.rightViewMode = .always
//    }
    
//    func setRightEyeIconWithBiometric(biometricClosure: () -> Void) {
//
//        let eyeBtn = UIButton(type: .system)
//        eyeBtn.tintColor = .AxiaBlue1
//        eyeBtn.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
//        eyeBtn.addTarget(self, action: #selector(rightEyeBtn), for: .touchUpInside)
//        eyeBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
//        eyeBtn.frame = CGRect(x: CGFloat(eyeBtn.frame.size.width - 25),
//                                 y: CGFloat(5),
//                                 width: CGFloat(25),
//                                 height: CGFloat(25))
//
//        let bioBtn = UIButton(type: .system)
//        bioBtn.tintColor = .AxiaBlue1
//        bioBtn.setImage(UIImage.init(systemName: "eye.slash.fill"), for: .normal)
//        bioBtn.addTarget(self, action: #selector(rightEyeBtn), for: .touchUpInside)
//        bioBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
//        bioBtn.frame = CGRect(x: CGFloat(bioBtn.frame.size.width - 25),
//                                 y: CGFloat(5),
//                                 width: CGFloat(25),
//                                 height: CGFloat(25))
//
//        self.rightView = eyeBtn
//        self.rightViewMode = .always
//    }
}


extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(
            red     : r/255,
            green   : g/255,
            blue    : b/255,
            alpha   : a)
    }
    
    static let BtnBackground = UIColor(named: "Btn Background") ?? UIColor(r: 241.0, g: 241.0, b: 244.0, a: 1.0)
    static let FieldError = UIColor(named: "Field Error") ?? UIColor(r: 255.0, g: 173.0, b: 5.0, a: 1.0)
    static let HangBlue = UIColor(named: "Hang Blue") ?? UIColor(r: 15.0, g: 175.0, b: 255.0, a: 1.0)
    static let HangGreyText = UIColor(named: "Hang Grey Text") ?? UIColor(r: 160.0, g: 160.0, b: 160.0, a: 1.0)
    static let HangGrey = UIColor(named: "Hang Grey") ?? UIColor(r: 193.0, g: 192.0, b: 201.0, a: 1.0)
    static let ProgressBarGrey = UIColor(named: "Progress Bar Grey") ?? UIColor(r: 237.0, g: 237.0, b: 237.0, a: 1.0)
    static let SwitchOff = UIColor(named: "Switch off") ?? UIColor(r: 99.0, g: 108.0, b: 117.0, a: 1.0)
    
}

