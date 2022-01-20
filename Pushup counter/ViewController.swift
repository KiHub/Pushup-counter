//
//  ViewController.swift
//  Pushup counter
//
//  Created by  Mr.Ki on 19.01.2022.
//

import UIKit

class ViewController: UIViewController{
   
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    var selected = 0
    
  //  var pickerData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.picker.delegate = self
        self.picker.dataSource = self
        
      //  pickerData = Array(1...300)
        
      //  pickerData = ["1","2","3"]
      
    }
    
    

    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
   
        
        
    }
    
//    override func  prepare(for: UIStoryboardSegue, sender: Any?) {
//          if segue.identifier == "Segue" {
//              guard let counterVC = segue.destination as? CounterViewController else {return}
//            counterVC.lab
//      }
    
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
        return 300
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       // return pickerData[row]
        return String(row+1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selected = row + 1
        print(selected)
    }
    
}
