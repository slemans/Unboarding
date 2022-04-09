//
//  ExtenshenView.swift
//  testTaskTechspool
//
//  Created by sleman on 9.04.22.
//

import UIKit

extension ViewController{
    
    func createStackView(_ axis: NSLayoutConstraint.Axis,
                         _ spacing: CGFloat,
                         _ backgroundColor: UIColor?,
                         _ translatesAutoresizingMaskIntoConstraints: Bool,
                         _ cornerRadius: CGFloat,
                         _ shadowColor: CGColor?,
                         _ shadowOpacity: Float,
                         _ layoutMargins: UIEdgeInsets?,
                         _ isLayoutMarginsRelativeArrangement: Bool,
                         _ heightAnchor: CGFloat?,
                         _ heightAnchorConstraint: Bool?) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = spacing
        stackView.backgroundColor = backgroundColor
        stackView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        stackView.layer.cornerRadius = cornerRadius
        stackView.layer.shadowColor = shadowColor
        stackView.layer.shadowOpacity = shadowOpacity
        stackView.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        if let layoutMargins = layoutMargins {
            stackView.layoutMargins = layoutMargins
        }
        if let heightAnchor = heightAnchor, let heightAnchorConstraint = heightAnchorConstraint {
            stackView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = heightAnchorConstraint
        }
        return stackView
    }
    
    func createUILabel(_ numberOfLines: Int,
                       _ textColor : UIColor,
                       _ text: String,
                       _ font: UIFont) -> UILabel{
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = numberOfLines
        label.font = font
        label.textColor = textColor
        label.text = text
        return label
    }
    
    func createUIBotton(_ setTitle: String,
                        _ tag: Int,
                        _ addTarget: Selector) -> UIButton{
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("\(setTitle)", for: .normal)
        button.attributedTitle(for: .application)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.addTarget(self, action: addTarget, for: .touchUpInside)
        button.tag = tag
        return button
    }
}
