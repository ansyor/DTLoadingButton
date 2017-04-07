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
open class DTLoadingButton: UIButton {
    fileprivate var indicatorView: SWActivityIndicatorView = SWActivityIndicatorView(frame: CGRect.zero)
    
    @IBInspectable open var disabledTextColor: UIColor! = UIColor.white
    @IBInspectable open var enabledTextColor: UIColor! = UIColor.white {
        didSet {
            self.setTitleColor(self.enabledTextColor, for: UIControlState())
        }
    }
    
    @IBInspectable open var disabledBackgroundColor: UIColor! = UIColor(red: 0, green: 131.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
    @IBInspectable open var enabledBackgroundColor: UIColor! = UIColor(red: 0, green: 152.0 / 255.0, blue: 215.0 / 255.0, alpha: 1.0) {
        didSet {
            self.backgroundColor = self.enabledBackgroundColor
        }
    }
    
    @IBInspectable open var indicatorViewLineWidth: CGFloat = 2.0 {
        didSet {
            self.indicatorView.lineWidth = self.indicatorViewLineWidth
        }
    }
    
    @IBInspectable open var indicatorColor: UIColor! = UIColor.lightGray {
        didSet {
            self.indicatorView.color = self.indicatorColor
        }
    }
    
    @IBInspectable open var normalText: String! = "" {
        didSet {
            self.setTitle(self.normalText, for: UIControlState())
        }
    }
    @IBInspectable open var loadingText: String! = "LOADING..."
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.initIndicatorView()
        self.initView()
    }
    
    fileprivate func initIndicatorView() {
        self.indicatorView.lineWidth = self.indicatorViewLineWidth
        self.indicatorView.color = self.indicatorColor
        self.indicatorView.backgroundColor = self.enabledBackgroundColor
        self.indicatorView.isHidden = true
    }
    
    fileprivate func initView() {
        self.backgroundColor = self.enabledBackgroundColor
        self.setTitleColor(self.enabledTextColor, for: UIControlState())
        self.setTitle(self.normalText, for: UIControlState())
    }
    
    fileprivate func setupIndicatorView() {
        self.indicatorView.removeFromSuperview()
        self.indicatorView.frame = self.calculateIndicatorViewFrame()
        self.indicatorView.backgroundColor = self.disabledBackgroundColor
        
        self.addSubview(indicatorView)
        
        if !self.indicatorView.isHidden {
            self.indicatorView.startAnimating()
        }
    }
    
    fileprivate func calculateIndicatorViewFrame() -> CGRect {
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
            return CGRect(x: x, y: y, width: width, height: height)
        }
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    fileprivate func startAnimatingIndicatorView() {
        self.indicatorView.isHidden = false
        self.indicatorView.startAnimating()
    }
    
    fileprivate func stopAnimatingIndicatorView() {
        self.indicatorView.isHidden = true
        self.indicatorView.stopAnimating()
    }
    
    override open func draw(_ rect: CGRect) {
        self.setupIndicatorView()
        
        super.draw(rect)
    }
}

//
// MARK: Public methods and properties
//
extension DTLoadingButton {
    public func disable() {
        self.setTitle(self.loadingText, for: UIControlState())
        self.backgroundColor = self.disabledBackgroundColor
        self.setTitleColor(self.disabledTextColor, for: UIControlState())
        self.isUserInteractionEnabled = false
    }
    
    public func enable() {
        self.setTitle(self.normalText, for: UIControlState())
        self.backgroundColor = self.enabledBackgroundColor
        self.setTitleColor(self.enabledTextColor, for: UIControlState())
        self.isUserInteractionEnabled = true
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
