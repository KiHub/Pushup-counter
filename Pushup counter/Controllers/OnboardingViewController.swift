//
//  OnboardingViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 11.02.2022.
//

import UIKit
import SnapKit


class OnboardingViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}

extension OnboardingViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        
        let page1 = ViewController1()
        let page2 = ViewController2()
        let page3 = ViewController3()
        
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
     //   pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalTo(view.fs_bottom).inset(50)
        }

    }
}

// MARK: - Actions

extension OnboardingViewController {
    
    // How we change page when pageControl tapped.
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSources

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // last
        } else {
            return pages[currentIndex - 1]  // previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // next
        } else {
            return  pages.first              // first
        }
    }
}

// MARK: - Delegates

extension OnboardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
    }
}

// MARK: - ViewControllers

class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceVC1()
    
    }
    
    func interfaceVC1() {
        
        if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background) }
        
        let label = UILabel()
        label.text = "🎉 Hey,"
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        label.font = UIFont(name: "Avenir Next Regular", size: 28)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(200)
        }
        let tipText = UILabel()
        tipText.text = "This app will count push ups instead of you"
        tipText.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        tipText.font = UIFont(name: "Avenir Next Regular", size: 18)
        tipText.numberOfLines = 0
        view.addSubview(tipText)
        tipText.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(label).inset(50)
        }
        
        
    }
}


class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceVC2()
        
    }
    func interfaceVC2() {
        if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background)
    
        }
        
        let label = UILabel()
        label.text = "⏱ Counter mode"
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        label.font = UIFont(name: "Avenir Next Regular", size: 28)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(200)
        }
        let tipText = UILabel()
        tipText.text = "Create your own exercise sets. This app will count your push ups and sets"
        tipText.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        tipText.font = UIFont(name: "Avenir Next Regular", size: 18)
        tipText.numberOfLines = 0
        view.addSubview(tipText)
        tipText.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(label).inset(50)
        }
        let labelTwo = UILabel()
        labelTwo.text = "🏆 Challenge mode"
        labelTwo.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        labelTwo.font = UIFont(name: "Avenir Next Regular", size: 28)
        view.addSubview(labelTwo)
        labelTwo.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(tipText).inset(150)
        }
        labelTwo.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(label).inset(200)
        }
        let tipTextTwo = UILabel()
        tipTextTwo.text = "Improve your push ups skills. During 30 days, you may lift skills to the next level"
        tipTextTwo.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        tipTextTwo.font = UIFont(name: "Avenir Next Regular", size: 18)
        tipTextTwo.numberOfLines = 0
        view.addSubview(tipTextTwo)
        tipTextTwo.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(labelTwo).inset(50)
        }
    }
}


class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interfaceVC3()
    }
    func interfaceVC3() {
        if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background) }
        view.contentMode = .scaleAspectFill
        
        let topLabel = UILabel()
        topLabel.text = "🎯 Ready?"
        topLabel.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        topLabel.font = UIFont(name: "Avenir Next Regular", size: 28)
        view.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(200)
        }
        let label = UILabel()
        label.text = "It's easy. Chose counter or challenge mode. Put a phone on the floor right opposite your chest and press the start button"
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir Next Regular", size: 18)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(topLabel).inset(50)
        }
        let button = UIButton()
        if let image = UIImage(named: "Button85") {
            button.setImage(image, for: .normal) }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(80)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc private func buttonTapped() {
        print("Tapped")
        pushSegue()
    }
    
    func pushSegue(){
        
        let pvc = self.parent as! UIPageViewController
        pvc.dismiss(animated: false, completion: nil)
        
    }
}



