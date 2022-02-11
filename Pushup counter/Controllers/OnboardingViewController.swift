//
//  OnboardingViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 11.02.2022.
//

import UIKit


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
            
            // set initial viewController to be displayed
            
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        }
        
        func style() {
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPageIndicatorTintColor = .black
            pageControl.pageIndicatorTintColor = .systemGray2
            pageControl.numberOfPages = pages.count
            pageControl.currentPage = initialPage
        }
        
        func layout() {
            view.addSubview(pageControl)
            
            NSLayoutConstraint.activate([
                pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 20),
                view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
            ])
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
                return pages.first              // first
            }
        }
    }

    // MARK: - Delegates

    extension OnboardingViewController: UIPageViewControllerDelegate {
        
        // pageControl sync with viewControllers
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
            if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background)
            }
        }
    }

    class ViewController2: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
         //   view.backgroundColor = .systemGreen
            if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background)
            }
        }
    }

    class ViewController3: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            if let background = UIImage(named: "Background2.jpg") {
            view.backgroundColor = UIColor(patternImage: background)
            }
        }
    }
