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
    
  //  var pickerData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.picker.delegate = self
        self.picker.dataSource = self
        picker.selectRow(24, inComponent: 0, animated: true)
     //   let y = picker.frame.origin.y
        
      //  picker.transform = CGAffineTransform(rotationAngle: -90 * (.pi/180))
     //   picker.frame = CGRect(x: -100, y: y, width: view.frame.width + 200, height: 100)
        
    }
    
    

    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
   
        
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let counterVC = segue.destination as? CounterViewController else {return}
        counterVC.labelNumber = selected
      
        
        
    }
   

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
  
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      //  return pickerData.count
        return 360
    }
    
//     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//       // return pickerData[row]
//        return String(row+1)
//    }
    
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
       // view.transform = CGAffineTransform(rotationAngle: (90 * (.pi/180)))
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: UIFont.Weight.medium)
        view.addSubview(label)
        return view
    }
    
}
