//
//  OsagoViewController.swift
//  OSAGO
//
//  Created by Павел Музычкин on 17.07.17.
//  Copyright © 2017 MPA. All rights reserved.
//

import UIKit

class OsagoViewController: UIViewController {
    
    
    // исходные данные для расчета - нужнно вводить
    // пока задаем константами
    let baseSum: Double = 1980      // базовая тарифная ставка
    let koeffArea: Double = 2       // коэффициент территории
    let countDriver: Double = 4     // число водителей
    let experDriver: Double = 5     // водительский стаж
    
    @IBOutlet weak var koeffAge: UILabel!
    @IBOutlet weak var koeffPower: UILabel!
    @IBOutlet weak var totalSum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func changeSliderAge(_ sender: UISlider) {
        
        let curentAge = Double(sender.value)
        if curentAge < 22 && experDriver < 3 {
        let koeffAgeValue = 1.8
            koeffAge.text = String(koeffAgeValue)
        }
        print("\(curentAge)")
        

        }
    
    
    @IBAction func changeSliderPower(_ sender: UISlider) {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
