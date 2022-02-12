//
//  ViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 19.01.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var picker: UIPickerView!
    
    let defaults = UserDefaults.standard
    var selected = 25
    var selectedSet = 3
    var selectedSetsArray = ["x1", "x2", "x3"]
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.selectRow(24, inComponent: 0, animated: true)
        picker.selectRow(2, inComponent: 1, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstLaunch()
        
//        if Core.shared.isNewUser() {
//            //show onboarding
//
//            let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as! OnboardingViewController
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        }
    }
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        infoAlert()
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func unwindToFirstVC(segue: UIStoryboardSegue) {
    }
    //MARK: - Alert
    func infoAlert() {
        let color = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        let alert = UIAlertController(title: "Quick tip", message: "1. Choose your push ups quantity goal. 2. Place phone on the floor opposite your chest 3. Press start button and just do push up 4. When you push up corrctly, counter will update 5. After, you can check days with completed exercises on calendar page", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Ok", style: .default)
        cancel.setValue(color, forKey: "titleTextColor")
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let counterVC = segue.destination as? CounterViewController else {return}
        counterVC.labelNumber = selected
        counterVC.sets = selectedSet
        
       // self.hidesBottomBarWhenPushed = true
    }
    
}
//MARK: - PickerView settings
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0:
            return 360
        case 1:
            return 20
      //      return 20
        default:
              return 0
        }
        
       // return 360
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return "\(row)"
        case 1:
            return "\(row)"
        default:
              return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            selected = row + 1
            print("selected: \(selected)")
        case 1:
            selectedSet = row + 1
            print("selectedSet: \(selectedSet)")
        default:
              break
        }
        
      //  selected = row + 1
      //  print(selected)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let  view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        switch component {
        case 0:
            label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
            view.addSubview(label)
            label.text = String(row + 1)
            return view
        case 1:
            label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
            view.addSubview(label)
            label.text = "x\(row + 1)"
            return view
        default:
              return view
        }
        
      //  label.text = String(row)
//        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
//        view.addSubview(label)
  //     return view
    }
    
//    class Core {
//        static let shared = Core()
//
//        func isNewUser() -> Bool {
//            return !UserDefaults.standard.bool(forKey: "isNewUser")
//        }
//        func setIsNotNewUser() {
//            UserDefaults.standard.set(true, forKey: "isNewUser")
//        }
//    }
    
    func firstLaunch() {
        
        if defaults.bool(forKey: "First launch") == true {
            print("Second+")
            
            defaults.set(true, forKey: "First launch")
        } else {
            print("First")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as! OnboardingViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
            defaults.set(true, forKey: "First launch")
        }
        
    }
    
    
}
