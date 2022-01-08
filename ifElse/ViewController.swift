//
//  ViewController.swift
//  ifElse
//
//  Created by 方仕賢 on 2022/1/6.
//

import UIKit

class ViewController: UIViewController {
    
   
    //年齡選擇及數字顯示欄位
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    
    //名字欄位
    @IBOutlet weak var nameTextField: UITextField!
    
    //預算欄位
    @IBOutlet weak var budgetTextField: UITextField!
    
    //狗狗體型選擇欄位
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    
    //提醒填入名字的字樣
    @IBOutlet weak var nameWarningLabel: UILabel!
    
    //顯示配對結果的字樣
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //背景顏色
    @IBOutlet weak var upperColorView: UIView!
    
    //遮住結果的初始畫面
    @IBOutlet weak var questionDogView: UIView!
    
    //狗狗品種的圖片
    @IBOutlet weak var dogImageView1: UIImageView!
    @IBOutlet weak var dogImageView2: UIImageView!
    @IBOutlet weak var dogImageView3: UIImageView!
    @IBOutlet weak var dogImageView4: UIImageView!
    @IBOutlet weak var dogImageView5: UIImageView!
    @IBOutlet weak var dogImageView6: UIImageView!
    @IBOutlet weak var dogImageView7: UIImageView!
    
    //狗狗名稱
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var nameLabel4: UILabel!
    @IBOutlet weak var nameLabel5: UILabel!
    @IBOutlet weak var nameLabel6: UILabel!
    @IBOutlet weak var nameLabel7: UILabel!
    
    //小型犬的圖片名稱
    let smallDogs = ["比熊", "吉娃娃", "哈瓦那犬", "英國玩具㹴", "凱恩㹴", "博美", "蝴蝶犬"]
    //小型犬的名稱
    let smallDogsnNames = ["Bichon", "Chihuahua", "Havanese", "English Toy Terrier", "Cain Terrier", "Hiromi", "Papillon"]
    
    //中型犬的圖片名稱
    let mediumDogs = ["巴哥犬","巴塞特獵犬" ,"冰島牧羊犬","柯基犬", "柴犬","凱利藍㹴", "北海道犬"]
    
    //中型犬的名稱
    let mediumDogsNames = ["Pug", "Basset Hound", "Icelandic Sheepdog", "Corgi", "Shiba Inu", "Carry Blue Terrier", "Hooded Dog"]
    
    //大型犬的圖片名稱
    let bigDogs = ["大丹犬","大麥町", "西藏獒犬", "伯恩山犬", "黃金獵犬","維茲拉犬","羅威納" ]
    
    //大型犬的名稱
    let bigDogsNames = ["Great Dane", "Dalmatian", "Tibetan Mastiff", "Bernese Mountain Dog", "Golden Retriever", "Hungarian Vizsla", "Rottweiler"]
    
    //預算初始值
    var budget:Int = 0
    
    //顯示哪種體型狗的初始名稱
    var sizeOfDogs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        upperColor()
        
        
    }
    
    //畫出背景顏色的方法
    func upperColor(){
        let up = UIBezierPath()
        up.move(to: CGPoint(x: 0, y: 0))
        up.addLine(to: CGPoint(x: 0, y: view.bounds.height/2))
        up.addCurve(to: CGPoint(x: view.bounds.width, y: view.bounds.height/2), controlPoint1: CGPoint(x: 135, y: 600), controlPoint2: CGPoint(x: 270, y: 200))
        up.addLine(to: CGPoint(x: view.bounds.width, y: 0))
        up.close()
        
        let upLayer = CAShapeLayer()
        upLayer.path = up.cgPath
        upLayer.fillColor = CGColor(red: 0.7, green: 0.5, blue: 0.6, alpha: 1)
        upLayer.lineWidth = 0
        
        upperColorView.layer.addSublayer(upLayer)
        
    }

    //選擇年齡的方法
    @IBAction func pickAge(_ sender: UISlider) {
        
        view.endEditing(true)
        ageLabel.text = String(Int(sender.value))

    }
    
    //選擇性別
    @IBAction func chooseGender(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    //選擇狗狗體型
    @IBAction func pickSize(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    //姓名輸入
    @IBAction func enterName(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    //去除所有狗狗名稱的方法
    func removeAllNames() {
        nameLabel1.text = ""
        nameLabel2.text = ""
        nameLabel3.text = ""
        nameLabel4.text = ""
        nameLabel5.text = ""
        nameLabel6.text = ""
        nameLabel7.text = ""

    }
    
    //送出尋狗條件的按鈕
    @IBAction func sendMessage(_ sender: Any) {
        
        //收起鍵盤
        view.endEditing(true)
        
        //檢視是否有填入名字
        if nameTextField.text == "" {
            
            nameWarningLabel.text = "Please enter your name!"
            
        } else {
            
            //去除提醒字樣及遮罩圖片
            nameWarningLabel.text = ""
            questionDogView.isHidden = true
            
            //檢視預算欄位是否有值
            if let newBudget = Int(budgetTextField.text!) {
                
                budget = newBudget
                
            } else {
                
                budget = 30000
                
            }
            
            //先藉由狗狗體型的選項篩選後，再藉由預算去篩選出最後結果
            switch sizeSegmentedControl.selectedSegmentIndex {
            case 0:
                
                sizeOfDogs = "small dogs"
                
                switch budget {
                    
                case 0..<5000:
                    
                    removeAllNames()
                    dogImageView1.image = UIImage(named: "paw")
                    dogImageView2.image = UIImage(named: "paw")
                    dogImageView3.image = UIImage(named: "paw")
                    dogImageView4.image = UIImage(named: "paw")
                    dogImageView5.image = UIImage(named: "paw")
                    dogImageView6.image = UIImage(named: "paw")
                    dogImageView7.image = UIImage(named: "paw")
                    
                    descriptionLabel.text = "Oops! There's no puppies fit your requirement. Please check your budget."
                    
                case 5000..<10000:
                    
                    dogImageView1.image = UIImage(named: "\(smallDogs[0])")
                    nameLabel1.text = smallDogsnNames[0]
                    dogImageView2.image = UIImage(named: "\(smallDogs[1])")
                    nameLabel2.text = smallDogsnNames[1]
                    dogImageView3.image = UIImage(named: "paw")
                    nameLabel3.text = ""
                    dogImageView4.image = UIImage(named: "paw")
                    nameLabel4.text = ""
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                    
                case 10000..<15000:
                    
                    dogImageView1.image = UIImage(named: "\(smallDogs[0])")
                    nameLabel1.text = smallDogsnNames[0]
                    
                    dogImageView2.image = UIImage(named: "\(smallDogs[1])")
                    nameLabel2.text = smallDogsnNames[1]
                    dogImageView3.image = UIImage(named: "\(smallDogs[2])")
                    nameLabel3.text = smallDogsnNames[2]
                    dogImageView4.image = UIImage(named: "\(smallDogs[3])")
                    nameLabel4.text = smallDogsnNames[3]
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                    
                default:
                    
                    dogImageView1.image = UIImage(named: "\(smallDogs[0])")
                    nameLabel1.text = smallDogsnNames[0]
                    dogImageView2.image = UIImage(named: "\(smallDogs[1])")
                    nameLabel2.text = smallDogsnNames[1]
                    dogImageView3.image = UIImage(named: "\(smallDogs[2])")
                    nameLabel3.text = smallDogsnNames[2]
                    dogImageView4.image = UIImage(named: "\(smallDogs[3])")
                    nameLabel4.text = smallDogsnNames[3]
                    
                    dogImageView5.image = UIImage(named: "\(smallDogs[4])")
                    nameLabel5.text = smallDogsnNames[4]
                    dogImageView6.image = UIImage(named: "\(smallDogs[5])")
                    nameLabel6.text = smallDogsnNames[5]
                    dogImageView7.image = UIImage(named: "\(smallDogs[6])")
                    nameLabel7.text = smallDogsnNames[6]
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                }
                
                
            case 1:
                
                sizeOfDogs = "medium dogs"
                
                switch budget {
                
                case 0..<10000:
                    
                    removeAllNames()
                    dogImageView1.image = UIImage(named: "paw")
                    dogImageView2.image = UIImage(named: "paw")
                    dogImageView3.image = UIImage(named: "paw")
                    dogImageView4.image = UIImage(named: "paw")
                    dogImageView5.image = UIImage(named: "paw")
                    dogImageView6.image = UIImage(named: "paw")
                    dogImageView7.image = UIImage(named: "paw")
                
                    descriptionLabel.text = "Oops! There's no puppies fit your requirement. Please check your budget."
                
                case 10000..<15000:
                    
                    dogImageView1.image = UIImage(named: "\(mediumDogs[0])")
                    nameLabel1.text = mediumDogsNames[0]
                    dogImageView2.image = UIImage(named: "\(mediumDogs[1])")
                    nameLabel2.text = mediumDogsNames[1]
                    dogImageView3.image = UIImage(named: "paw")
                    nameLabel3.text = ""
                    dogImageView4.image = UIImage(named: "paw")
                    nameLabel4.text = ""
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                
                case 15000..<20000:
                    
                    dogImageView1.image = UIImage(named: "\(mediumDogs[0])")
                    nameLabel1.text = mediumDogsNames[0]
                    
                    dogImageView2.image = UIImage(named: "\(mediumDogs[1])")
                    nameLabel2.text = mediumDogsNames[1]
                    dogImageView3.image = UIImage(named: "\(mediumDogs[2])")
                    nameLabel3.text = mediumDogsNames[2]
                    dogImageView4.image = UIImage(named: "\(mediumDogs[3])")
                    nameLabel4.text = mediumDogsNames[3]
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                
                default:
                    
                    dogImageView1.image = UIImage(named: "\(mediumDogs[0])")
                    nameLabel1.text = mediumDogsNames[0]
                    dogImageView2.image = UIImage(named: "\(mediumDogs[1])")
                    nameLabel2.text = mediumDogsNames[1]
                    
                    dogImageView3.image = UIImage(named: "\(mediumDogs[2])")
                    nameLabel3.text = mediumDogsNames[2]
                    dogImageView4.image = UIImage(named: "\(mediumDogs[3])")
                    nameLabel4.text = mediumDogsNames[3]
                    dogImageView5.image = UIImage(named: "\(mediumDogs[4])")
                    nameLabel5.text = mediumDogsNames[4]
                    dogImageView6.image = UIImage(named: "\(mediumDogs[5])")
                    nameLabel6.text = mediumDogsNames[5]
                    dogImageView7.image = UIImage(named: "\(mediumDogs[6])")
                    nameLabel7.text = mediumDogsNames[6]
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                }
                
                
            default:
                
                sizeOfDogs = "big dogs"
                
                switch budget {
                
                case 0..<15000:
                    removeAllNames()
                    dogImageView1.image = UIImage(named: "paw")
                    dogImageView2.image = UIImage(named: "paw")
                    dogImageView3.image = UIImage(named: "paw")
                    dogImageView4.image = UIImage(named: "paw")
                    dogImageView5.image = UIImage(named: "paw")
                    dogImageView6.image = UIImage(named: "paw")
                    dogImageView7.image = UIImage(named: "paw")
                    
                    descriptionLabel.text = "Oops! There's no puppies fit your requirement. Please check your budget."
                
                case 15000..<20000:
                    dogImageView1.image = UIImage(named: "\(bigDogs[0])")
                    nameLabel1.text = bigDogsNames[0]
                    dogImageView2.image = UIImage(named: "\(bigDogs[1])")
                    nameLabel2.text = bigDogsNames[1]
                    dogImageView3.image = UIImage(named: "paw")
                    nameLabel3.text = ""
                    dogImageView4.image = UIImage(named: "paw")
                    nameLabel4.text = ""
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                    
                case 20000...25000:
                    dogImageView1.image = UIImage(named: "\(bigDogs[0])")
                    nameLabel1.text = bigDogsNames[0]
                    dogImageView2.image = UIImage(named: "\(bigDogs[1])")
                    nameLabel2.text = bigDogsNames[1]
                    dogImageView3.image = UIImage(named: "\(bigDogs[2])")
                    nameLabel3.text = bigDogsNames[2]
                    dogImageView4.image = UIImage(named: "\(bigDogs[3])")
                    nameLabel4.text = bigDogsNames[3]
                    dogImageView5.image = UIImage(named: "paw")
                    nameLabel5.text = ""
                    dogImageView6.image = UIImage(named: "paw")
                    nameLabel6.text = ""
                    dogImageView7.image = UIImage(named: "paw")
                    nameLabel7.text = ""
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                default:
                    dogImageView1.image = UIImage(named: "\(bigDogs[0])")
                    nameLabel1.text = bigDogsNames[0]
                    dogImageView2.image = UIImage(named: "\(bigDogs[1])")
                    nameLabel2.text = bigDogsNames[1]
                    dogImageView3.image = UIImage(named: "\(bigDogs[2])")
                    nameLabel3.text = bigDogsNames[2]
                    dogImageView4.image = UIImage(named: "\(bigDogs[3])")
                    nameLabel4.text = bigDogsNames[3]
                    dogImageView5.image = UIImage(named: "\(bigDogs[4])")
                    nameLabel5.text = bigDogsNames[4]
                    dogImageView6.image = UIImage(named: "\(bigDogs[5])")
                    nameLabel6.text = bigDogsNames[5]
                    dogImageView7.image = UIImage(named: "\(bigDogs[6])")
                    nameLabel7.text = bigDogsNames[6]
                    
                    descriptionLabel.text = "Dear \(nameTextField.text!), you chose \(sizeOfDogs). We have some puppies below fit your requirement!"
                    
                }
               
                
            }
            
            
            
            
        }
        
        
        
        
    }
    
   
    
    
}


