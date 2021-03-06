//
//  DTLoadingButton.swift
//  Pods
//

import UIKit
import SWActivityIndicatorView

//
// MARK: Initialize and default setup
//
@IBDesignable
public class DTLoadingButton: UIButton {
    private var indicatorView: SWActivityIndicatorView = SWActivityIndicatorView(frame: CGRectZero)
    
    @IBInspectable public var disabledTextColor: UIColor! = UIColor.whiteColor()
    @IBInspectable public var enabledTextColor: UIColor! = UIColor.whiteColor() {
        didSet {
            self.setTitleColor(self.enabledTextColor, forState: .Normal)
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor! = UIColor(red: 0, green: 131.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
    @IBInspectable public var enabledBackgroundColor: UIColor! = UIColor(red: 0, green: 152.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0) {
        didSet {
            self.backgroundColor = self.enabledBackgroundColor
        }
    }
    
    @IBInspectable public var indicatorViewLineWidth: CGFloat = 2.0 {
        didSet {
            self.indicatorView.lineWidth = self.indicatorViewLineWidth
        }
    }
    
    @IBInspectable public var indicatorColor: UIColor! = UIColor.lightGrayColor() {
        didSet {
            self.indicatorView.color = self.indicatorColor
        }
    }
    
    @IBInspectable public var normalText: String! = "" {
        didSet {
            self.setTitle(self.normalText, forState: .Normal)
        }
    }
    @IBInspectable public var loadingText: String! = "LOADING..."
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.initIndicatorView()
        self.initView()
    }
    
    private func initIndicatorView() {
        self.indicatorView.lineWidth = self.indicatorViewLineWidth
        self.indicatorView.color = self.indicatorColor
        self.indicatorView.backgroundColor = self.enabledBackgroundColor
        self.indicatorView.hidden = true
    }
    
    private func initView() {
        self.backgroundColor = self.enabledBackgroundColor
        self.setTitleColor(self.enabledTextColor, forState: .Normal)
        self.setTitle(self.normalText, forState: .Normal)
    }
    
    private func setupIndicatorView() {
        self.indicatorView.removeFromSuperview()
        self.indicatorView.frame = self.calculateIndicatorViewFrame()
        self.indicatorView.backgroundColor = self.disabledBackgroundColor
        
        self.addSubview(indicatorView)
        
        if !self.indicatorView.hidden {
            self.indicatorView.startAnimating()
        }
    }
    
    private func calculateIndicatorViewFrame() -> CGRect {
        let padding: CGFloat = 5
        var y = padding
        var height = self.frame.height - (padding * 2)
        var width = height
        var x = (self.frame.width / 2) - (width / 2)
        
        if let label = self.titleLabel {
            height = label.frame.height - 5
            width = height
            x = label.frame.origin.x - (width + padding)
            y = label.frame.origin.y +  ((label.frame.height - height) / 2.0)
            return CGRectMake(x, y, width, height)
        }
        
        return CGRectMake(x, y, width, height)
    }
    
    private func startAnimatingIndicatorView() {
        self.indicatorView.hidden = false
        self.indicatorView.startAnimating()
    }
    
    private func stopAnimatingIndicatorView() {
        self.indicatorView.hidden = true
        self.indicatorView.stopAnimating()
    }
    
    override public func drawRect(rect: CGRect) {
        self.setupIndicatorView()
        
        super.drawRect(rect)
    }
}

//
// MARK: Public methods and properties
//
extension DTLoadingButton {
    public func disable() {
        self.setTitle(self.loadingText, forState: .Normal)
        self.backgroundColor = self.disabledBackgroundColor
        self.setTitleColor(self.disabledTextColor, forState: .Normal)
        self.userInteractionEnabled = false
    }
    
    public func enable() {
        self.setTitle(self.normalText, forState: .Normal)
        self.backgroundColor = self.enabledBackgroundColor
        self.setTitleColor(self.enabledTextColor, forState: .Normal)
        self.userInteractionEnabled = true
    }
    
    public func startAnimating() {
        self.disable()
        self.startAnimatingIndicatorView()
    }
    
    public func stopAnimating() {
        self.enable()
        self.stopAnimatingIndicatorView()
    }
}