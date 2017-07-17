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
    let experDriver: Double = 2     // водительский стаж
   
    //   вычисляемые коэффициенты
    var koeffAgeValue: Double = 1.8
    var koeffPowerValue: Double = 0.6
    var koeffDriverValue: Double = 1
    
    @IBOutlet weak var koeffAge: UILabel!
    @IBOutlet weak var koeffPower: UILabel!
    @IBOutlet weak var totalSum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        koeffAge.text = "1.8"
        koeffPower.text = "0.6"
        totalSum.text = String(calcOsago())
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeSliderAge(_ sender: UISlider) {
        
        let curentAge = sender.value
        
        //var koeffAgeValue = 1.0
        
        if curentAge < 22 && self.experDriver < 3 {
        koeffAgeValue = 1.8
        }
        
        if curentAge < 22 && self.experDriver >= 3 {
            koeffAgeValue = 1.6
        }
        if curentAge >= 22 && self.experDriver < 3 {
            koeffAgeValue = 1.7
        }
        if curentAge >= 22 && self.experDriver >= 3 {
            koeffAgeValue = 1.0
        }
        
        
        self.koeffAge.text = String(koeffAgeValue)
        
        let xxx = calcOsago()
        self.totalSum.text = String(xxx)
        
        //print("Возраст: \(curentAge)")
        //print("Стаж: \(experDriver)")
        //print("Коэффициент возраста:" + (koeffAge?.text)!)
        
        }
    
    
    @IBAction func changeSliderPower(_ sender: UISlider) {
        
        let curentPower = sender.value
        
        //var koeffPowerValue: Float = 1.0
                
        if curentPower < 50 {
            koeffPowerValue = 0.6
        }
        
        if curentPower >= 50 && curentPower < 70 {
            koeffPowerValue = 1.0
        }
        
        if curentPower >= 70 && curentPower < 100 {
            koeffPowerValue = 1.1
        }
        if curentPower >= 100 && curentPower < 120 {
            koeffPowerValue = 1.2
        }
        if curentPower >= 121 && curentPower < 150 {
            koeffPowerValue = 1.4
        }

        if curentPower >= 150 {
            koeffPowerValue = 1.6
        }

        self.koeffPower.text = String(koeffPowerValue)
        let xxx = calcOsago()
        self.totalSum.text = String(xxx)
        
        
        //print("Мощность: \(curentPower)")
        //print("Коэффициент мощности:" + (koeffPower?.text)!)
        
    }
    
    private func calcOsago() ->Double {
        if countDriver == 0 {
            koeffDriverValue = 1.8
        }
        else
        {
        koeffDriverValue = 1.0
        }
     return baseSum * koeffArea * koeffDriverValue * koeffAgeValue * koeffPowerValue
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
