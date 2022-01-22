//
//  ViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 19.01.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var picker: UIPickerView!
    
    var selected = 25
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.selectRow(24, inComponent: 0, animated: true)
        
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
        let alert = UIAlertController(title: "Quick tip", message: "1. Choose your push ups quantity goal. 2. Place phone on the floor opposite your chest 3. Press start button and just do push up 4. After, you can check days with completed exercise on calendar page", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Ok", style: .default)
        cancel.setValue(color, forKey: "titleTextColor")
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let counterVC = segue.destination as? CounterViewController else {return}
        counterVC.labelNumber = selected
    }
    
}
//MARK: - PickerView settings
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 360
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = row + 1
        print(selected)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let  view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        label.text = String(row+1)
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.231372549, blue: 0.5843137255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
        view.addSubview(label)
        return view
    }
}
