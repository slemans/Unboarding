//
//  ViewController.swift
//  testTaskTechspool
//
//  Created by sleman on 7.04.22.
//

import UIKit
import Spring


class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var holderView: SpringView!
    let scrollView = UIScrollView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        startSetting()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createPageForSlider()
    }

    
    private func createPageForSlider() {
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

            let labelDescription = createUILabel(0, .black, Constants.arrayTextTitle[x], UIFont(name: "Arial", size: 25)!)
            let labelSmallDescription = createUILabel(1, #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1), Constants.arrayTextDescription[x], UIFont.boldSystemFont(ofSize: 24.0))

            let buttonNextSlider = createUIBotton(Constants.buttonNext[x], x, #selector(didTapButton(_:)))
            let buttonBeforeSlider = createUIBotton("REFIUTA", x, #selector(didDownButton(_:)))

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
        
    }
    @objc func didTapButton(_ button: UIButton) {
        if button.tag < Constants.arrayTextTitle.count - 1 {
            scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag + 1), y: 0), animated: true)
            animationView("squeezeRight")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let singInVC = storyboard.instantiateViewController(identifier: "nextView")
            singInVC.modalPresentationStyle = .fullScreen
            present(singInVC, animated: true)
        }
    }
    
    @objc func didDownButton(_ button: UIButton) {
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag - 1), y: 0), animated: true)
        animationView("squeezeLeft")
    }
    
    private func startSetting(){
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        holderView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * CGFloat(Constants.arrayTextTitle.count), height: 0)
        scrollView.isPagingEnabled = true
    }
    
    private func animationView(_ tip: String){
        holderView.curve = "spring"
        holderView.animation = tip
        holderView.duration = 1.3 // продолжительность
        holderView.force = 1.1 // сила
        holderView.delay = 0.2
        holderView.animate()
    }
}




