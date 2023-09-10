//
//  FMProgressView.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 05.09.2023.
//


import UIKit

final class FMProgressView: UIView {
    
    var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }
    var gradientColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }

    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    private let progressLayer = CALayer()
    private let gradientLayer = CAGradientLayer()
    private let backgroundMask = CAShapeLayer()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.929, alpha: 1)
        layer.cornerRadius = 3
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 3
        setupLayers()
    }

    private func setupLayers() {
        layer.addSublayer(gradientLayer)

        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 1.29, d: 8.73, tx: -0.65, ty: -3.94))
        gradientLayer.bounds = bounds.insetBy(dx: -0.5 * bounds.size.width, dy: -0.5 * bounds.size.height)
        gradientLayer.position = center
    }

    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: 3).cgPath
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        progressLayer.frame = progressRect
        progressLayer.backgroundColor = UIColor.black.cgColor

        gradientLayer.frame = rect
        gradientLayer.colors = [
        UIColor(red: 0.02, green: 0.631, blue: 0.945, alpha: 1).cgColor,
        UIColor(red: 0.304, green: 0.738, blue: 0.452, alpha: 1).cgColor
        ]
        gradientLayer.endPoint = CGPoint(x: progress, y: 0.5)
    }
}
