//
//  ViewController.swift
//  testTaskTechspool
//
//  Created by sleman on 7.04.22.
//

import UIKit

class ViewControllewwwwwr: UIViewController, UIScrollViewDelegate {



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
        if let layoutMargins = layoutMargins {
            stackView.layoutMargins = layoutMargins
        }
        if let heightAnchor = heightAnchor, let heightAnchorConstraint = heightAnchorConstraint {
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
            let secondStackSlider = createStackView(.vertical, 0, nil, true, 0, nil, 0, UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0), true, nil, nil)
            let thirdStackSlider = createStackView(.vertical, 90, nil, true, 0, nil, 0, UIEdgeInsets(top: 10, left: 15, bottom: 30, right: 15), true, nil, nil)

            let fourthStackSlider = createStackView(.horizontal, 50, #colorLiteral(red: 0.9960784314, green: 0.462745098, blue: 0.1607843137, alpha: 1), false, 0, nil, 0, nil, false, 80, true)

          
            let image: UIImageView = {
                let image = UIImageView()
                image.contentMode = .scaleAspectFit
                image.image = UIImage(named: "\(Constants.arrayTextImages[x])")
                image.heightAnchor.constraint(equalToConstant: 300).isActive = true
                return image
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


            let buttonNextSlider: UIButton = {
                let button = UIButton()
                button.setTitleColor(.white, for: .normal)
                button.setTitle("\(Constants.buttonNext[x])", for: .normal)
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
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let singInVC = storyboard.instantiateViewController(identifier: "nextView")
            singInVC.modalPresentationStyle = .fullScreen
            present(singInVC, animated: true)
        }
    }
    @objc func didDounButton(_ button: UIButton) {
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag - 1), y: 0), animated: true)

    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y

        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset

        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)

        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            print("fff")
//            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25 - percentOffset.x) / 0.25, y: (0.25 - percentOffset.x) / 0.25)
//            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x / 0.25, y: percentOffset.x / 0.25)

        }
    }
}




