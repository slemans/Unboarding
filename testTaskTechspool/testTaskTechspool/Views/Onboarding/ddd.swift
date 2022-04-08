//
//  ViewController.swift
//  testTaskTechspool
//
//  Created by sleman on 7.04.22.
//

import UIKit

class ViewController333: UIViewController {


    @IBOutlet var holderView: UIView!
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startSetting()

    }

    func createStackView(_ axis: NSLayoutConstraint.Axis, _ spacing: CGFloat, _ backgroundColor: UIColor?, _ translatesAutoresizingMaskIntoConstraints: Bool, _ cornerRadius: CGFloat, _ shadowColor: CGColor?, _ shadowOpacity: Float, _ layoutMargins: UIEdgeInsets?, _ isLayoutMarginsRelativeArrangement: Bool, _ heightAnchor: CGFloat?, _ heightAnchorConstraint: Bool?) -> UIStackView {
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
        if let layoutMargins = layoutMargins{
            stackView.layoutMargins = layoutMargins
        }
        if let heightAnchor = heightAnchor, let heightAnchorConstraint = heightAnchorConstraint{
            stackView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = heightAnchorConstraint
        }
        
        return stackView
    }

    func startSetting() {
        holderView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)

        for x in 0..<Constants.arrayTextTitle.count {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
                        
            let firstStackSlider = createStackView(.vertical, 0, .white, false, 10, #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1), 0.8, nil, false, nil, nil)
            
//            let firstStackSlider: UIStackView = {
//                let stackView = UIStackView()
//                stackView.axis = .vertical
//                stackView.spacing = 0
//                stackView.backgroundColor = .white
//                stackView.translatesAutoresizingMaskIntoConstraints = false
//                stackView.layer.cornerRadius = 10
//                stackView.layer.shadowColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
//                stackView.layer.shadowOpacity = 0.8
//                return stackView
//            }()
            let secondStackSlider: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .vertical
                stackView.layoutMargins = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
                return stackView
            }()
            let image: UIImageView = {
                let image = UIImageView()
                image.contentMode = .scaleAspectFit
                image.image = UIImage(named: "\(Constants.arrayTextImages[x])")
                image.heightAnchor.constraint(equalToConstant: 300).isActive = true
                return image
            }()
            let thirdStackSlider: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .vertical
                stackView.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 30, right: 15)
                stackView.translatesAutoresizingMaskIntoConstraints = true
                stackView.spacing = 90
                stackView.isLayoutMarginsRelativeArrangement = true
                return stackView
            }()

            let labelDescription: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.numberOfLines = 0
                label.font = UIFont(name: "Arial", size: 25)
                label.textColor = .black
                label.text = Constants.arrayTextTitle[x]
                return label
            }()
            let labelSmallDescription: UILabel = {
                let label = UILabel()
                label.textAlignment = .center
                label.font = UIFont.boldSystemFont(ofSize: 24.0)
                label.textColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
                label.text = Constants.arrayTextDescription[x]
                return label
            }()
            let fourthStackSlider: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .horizontal
                stackView.spacing = 50
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.462745098, blue: 0.1607843137, alpha: 1)
                stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true

                return stackView
            }()

            let buttonNextSlider: UIButton = {
                let button = UIButton()
                button.setTitleColor(.white, for: .normal)
                button.setTitle("INIZIA", for: .normal)
                button.attributedTitle(for: .application)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
                button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
                button.tag = x
                return button
            }()

            let buttonBeforeSlider: UIButton = {
                let button = UIButton()
                button.setTitleColor(.white, for: .normal)
                button.setTitle("REFIUTA", for: .normal)
                button.attributedTitle(for: .application)
                button.addTarget(self, action: #selector(didDounButton(_:)), for: .touchUpInside)
                button.tag = x
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
                return button
            }()
            if x == 0 {
                buttonBeforeSlider.isHidden = true
                buttonNextSlider.contentHorizontalAlignment = .right
                fourthStackSlider.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 35)
                fourthStackSlider.isLayoutMarginsRelativeArrangement = true
            } else {
                fourthStackSlider.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
                fourthStackSlider.layer.shadowColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
                fourthStackSlider.layer.shadowOpacity = 0.8
                buttonBeforeSlider.setTitleColor(#colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1), for: .normal)
                buttonNextSlider.setTitleColor(#colorLiteral(red: 0.9960784314, green: 0.462745098, blue: 0.1607843137, alpha: 1), for: .normal)
            }

            secondStackSlider.addArrangedSubview(image)
            firstStackSlider.addArrangedSubview(secondStackSlider)
            thirdStackSlider.addArrangedSubview(labelDescription)
            thirdStackSlider.addArrangedSubview(labelSmallDescription)
            firstStackSlider.addArrangedSubview(thirdStackSlider)
            pageView.addSubview(firstStackSlider)
            fourthStackSlider.addArrangedSubview(buttonBeforeSlider)
            fourthStackSlider.addArrangedSubview(buttonNextSlider)
            pageView.addSubview(fourthStackSlider)
            scrollView.addSubview(pageView)
            NSLayoutConstraint.activate([
                firstStackSlider.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 60),
                firstStackSlider.leftAnchor.constraint(equalTo: pageView.leftAnchor, constant: 20),
                firstStackSlider.rightAnchor.constraint(equalTo: pageView.rightAnchor, constant: -20),
                fourthStackSlider.leftAnchor.constraint(equalTo: pageView.leftAnchor),
                fourthStackSlider.rightAnchor.constraint(equalTo: pageView.rightAnchor),
                fourthStackSlider.bottomAnchor.constraint(equalTo: pageView.bottomAnchor),
                buttonBeforeSlider.widthAnchor.constraint(equalTo: buttonNextSlider.widthAnchor, multiplier: 1)
            ])
        }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * CGFloat(Constants.arrayTextTitle.count), height: 0)
        scrollView.isPagingEnabled = true
    }
    @objc func didTapButton(_ button: UIButton) {
        if button.tag < Constants.arrayTextTitle.count - 1 {
            scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag + 1), y: 0), animated: true)
        }
    }
    @objc func didDounButton(_ button: UIButton) {
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag - 1), y: 0), animated: true)

    }
}




