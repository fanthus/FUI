//
//  FRUI.swift
//  FRUIDemo
//
//  Created by fanthus on 12/11/24.
//

import Foundation
import UIKit
import FRCategories

@objc public class FUI:NSObject {
    
    public static var defaultFontName:String = "PingFangSC-Regular"
    
    public static func font(of fontName:String?, fontSize:CGFloat, fontWeight:UIFont.Weight) -> UIFont {
        var font:UIFont
        if let fn = fontName {
            font = UIFont.init(name: fn, size: fontSize)!
        } else {
            font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        }
        return font
    }
    
    public static func makeLabel(txt:String?="", color:String="ffffff", fontName:String = FUI.defaultFontName, fontSize:CGFloat = 15, fontWeight:UIFont.Weight = UIFont.Weight.regular, align:NSTextAlignment = .left, superView:UIView?=nil, lineNum:Int=1) -> UILabel {
        let lab = UILabel()
        lab.textColor = UIColor.init( color)
        lab.font = font(of: fontName, fontSize: fontSize, fontWeight: fontWeight)
        lab.textAlignment = align
        lab.text = txt
        lab.numberOfLines = lineNum
        superView?.addSubview(lab)
        return lab
    }
    
    public static func makeButton(txt:String="", txtInset:UIEdgeInsets?=nil, color:String="ffffff", fontName:String = FUI.defaultFontName, fontSize:CGFloat=13, bgColor:String?=nil, img:String? = nil, imgEdgeInsets:UIEdgeInsets? = nil, bgImg:String?=nil, radius:CGFloat? = nil, size:CGSize = .zero, superView:UIView?=nil) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(txt, for: UIControl.State.normal)
        if let ttxtInset = txtInset { btn.titleEdgeInsets = ttxtInset }
        btn.titleLabel?.font = font(of: fontName, fontSize: fontSize, fontWeight: .regular)
        let titleColor = UIColor.init( color)
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        btn.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        if let bg = bgColor { btn.backgroundColor = UIColor(bg) }
        if let tbgImg = bgImg, tbgImg.isEmpty == false { btn.setBackgroundImage(UIImage(named:tbgImg), for: .normal) }
        if let timg = img, timg.isEmpty == false { btn.setImage(UIImage(named:timg), for: .normal) }
        if let timgEdgeInsets = imgEdgeInsets{ btn.imageEdgeInsets = timgEdgeInsets }
        if let tradius = radius { setLayer(view: btn, radius: tradius) }
        superView?.addSubview(btn)
        return btn
    }
    
    public static func makeImageView(imgName:String? = nil, contentMode:UIView.ContentMode = .scaleToFill, radius:CGFloat = 0, corner mask:CACornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner], stretchXPercent:CGFloat? = nil, stretchYPercent:CGFloat? = nil, superView:UIView?) -> UIImageView {
        let img = UIImageView()
        if let timgName = imgName, timgName.isEmpty == false {
            let ori = UIImage(named: timgName)
            if ori != nil && stretchXPercent != nil && stretchYPercent != nil {
                img.image = ori!.stretchableImage(withLeftCapWidth: Int(ori!.size.width * stretchXPercent!), topCapHeight: Int(ori!.size.width * stretchYPercent!))
            } else {
                img.image = ori
            }
        }
        if radius > 0.0 {
            img.layer.cornerRadius = radius
            img.layer.masksToBounds = true
            img.layer.maskedCorners = mask
        }
        img.contentMode = contentMode
        img.clipsToBounds = true
        superView?.addSubview(img)
        return img
    }
    
    public static func makeView(frame:CGRect = .zero, bgColor:String="00000000", radius:CGFloat = 0, corner mask: CACornerMask = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner] , userInterEnabled:Bool = true, superView:UIView? = nil) -> UIView {
        let uiview = UIView(frame:frame)
        let backgroundColor = UIColor.init( bgColor)
        uiview.backgroundColor = backgroundColor
        uiview.isUserInteractionEnabled = userInterEnabled
        if radius > 0.0 {
            uiview.layer.cornerRadius = radius
            uiview.layer.masksToBounds = true
            uiview.layer.maskedCorners = mask
        }
        superView?.addSubview(uiview)
        return uiview
    }
    
    public static func makeTextView(frame:CGRect = .zero, bgColor:String="00000000", text:String = "", txtColor:String = "ffffff", fontName:String = FUI.defaultFontName, fontSize:CGFloat, fontWeight:UIFont.Weight = UIFont.Weight.regular, superView:UIView? = nil) -> UITextView {
        var textView = UITextView.init(frame: frame)
        textView.font = font(of: fontName, fontSize: fontSize, fontWeight: fontWeight)
        textView.backgroundColor = UIColor.init( bgColor)
        textView.textColor = UIColor.init( txtColor)
        textView.text = text
        superView?.addSubview(textView);
        return textView
    }
    
    public static func setLayer(view:UIView,radius:CGFloat=0.0,borderWidth:CGFloat=0.0,borderColor:String?=nil,borderDarkColor:String?=nil) {
        setLayer(views: [view], radius: radius, borderWidth: borderWidth, borderColor: borderColor, borderDarkColor: borderDarkColor)
    }
    
    public static func setLayer(views:[UIView],radius:CGFloat=0.0,borderWidth:CGFloat=0.0,borderColor:String?=nil,borderDarkColor:String?=nil) {
        for view in views {
            if radius>0.0 {
                view.layer.cornerRadius = radius
                view.layer.masksToBounds = true
            }
            if borderWidth>0.0 {
                view.layer.borderWidth = borderWidth
            }
            if let color = borderColor {
                view.layer.borderColor = UIColor(color)?.cgColor
            }
        }
    }
    
    @objc public static func makeGradientLayer(startPoint:CGPoint, endPoint:CGPoint, startColor:UIColor, endColor:UIColor, frame:CGRect) -> CAGradientLayer {
        return makeGradientLayer(startPoint: startPoint, endPoint: endPoint, colors: [startColor,endColor], locations: [0,1], frame: frame)
    }
    
    @objc public static func makeGradientLayer(startPoint:CGPoint, endPoint:CGPoint, colors:[UIColor], locations:[NSNumber], frame:CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.colors = colors.map({ color in
            color.cgColor
        })
        layer.locations = locations
        layer.frame = frame
        return layer
    }
   
    
    @objc static func showAlertController(vc:UIViewController, title:String = "", msg:String = "", cancelTitle:String = "Cancel", cancelClosure:@escaping VoidVoidClosure, okTitle:String = "OK", okClosure:@escaping VoidVoidClosure) {
        let alertCtrl = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        alertCtrl.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: { _ in
            okClosure()
        }))
        alertCtrl.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: { _ in
            cancelClosure()
        }))
        vc.present(alertCtrl, animated: true, completion: nil)
    }
    
}

public extension FUI {
    
    
    static func addSubview<T:UIView>(_ subView:T, superView:UIView) -> T {
        superView.addSubview(subView)
        return subView
    }
    
    
    @objc static func relayout(_ view:UIView? = nil) {
        guard let tview = view else { return }
        tview.setNeedsLayout()
        tview.layoutIfNeeded()
    }
    
    /// 移除给定视图的所有子视图
    static func removeSubviews(_ superView:UIView) {
        superView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    /// 移除给定类型的子视图
    static func removeSubviews<T>(_ superView:UIView, type:T.Type) {
        for subview in superView.subviews where subview is T {
            subview.removeFromSuperview()
        }
    }
    
}

