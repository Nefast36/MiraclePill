//
//  ViewController.swift
//  MiraclePill
//
//  Created by Raphael Zaafrani on 7/17/17.
//  Copyright © 2017 Raphael Zaafrani. All rights reserved.
//

import UIKit

public extension UIView{
    func fadeIn(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
}

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var isStateBtn = false
    //pickers
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var statePicker: UIPickerView!
    //buttons
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var countryPickerButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    //label
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var ErrorMsgP1: UILabel!
    @IBOutlet weak var ErrorMsgP2: UILabel!
    //text fields
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    //images
    @IBOutlet weak var successImage: UIImageView!

    
    
    
    let countries = ["Pick one","United States","Ascension Island", "Andorra", "United Arab Emirates", "Afghanistan", "Antigua & Barbuda", "Anguilla", "Albania", "Armenia", "Angola", "Antarctica", "Argentina", "American Samoa", "Austria", "Australia", "Aruba", "Åland Islands", "Azerbaijan", "Bosnia & Herzegovina", "Barbados", "Bangladesh", "Belgium", "Burkina Faso", "Bulgaria", "Bahrain", "Burundi", "Benin", "St. Barthélemy", "Bermuda", "Brunei", "Bolivia", "Caribbean Netherlands", "Brazil", "Bahamas", "Bhutan", "Bouvet Island", "Botswana", "Belarus", "Belize", "Canada", "Cocos [Keeling] Islands", "Congo - Kinshasa", "Central African Republic", "Congo - Brazzaville", "Switzerland", "Côte d’Ivoire", "Cook Islands", "Chile", "Cameroon", "China", "Colombia", "Clipperton Island", "Costa Rica", "Cuba", "Cape Verde", "Curaçao", "Christmas Island", "Cyprus", "Czech Republic", "Germany", "Diego Garcia", "Djibouti", "Denmark", "Dominica", "Dominican Republic", "Algeria", "Ceuta & Melilla", "Ecuador", "Estonia", "Egypt", "Western Sahara", "Eritrea", "Spain", "Ethiopia", "Finland", "Fiji", "Falkland Islands", "Micronesia", "Faroe Islands", "France", "Gabon", "United Kingdom", "Grenada", "Georgia", "French Guiana", "Guernsey", "Ghana", "Gibraltar", "Greenland", "Gambia", "Guinea", "Guadeloupe", "Equatorial Guinea", "Greece", "So. Georgia & So. Sandwich Isl.", "Guatemala", "Guam", "Guinea-Bissau", "Guyana", "Hong Kong [China]", "Heard & McDonald Islands", "Honduras", "Croatia", "Haiti", "Hungary", "Canary Islands", "Indonesia", "Ireland", "Israel", "Isle of Man", "India", "British Indian Ocean Territory", "Iraq", "Iran", "Iceland", "Italy", "Jersey", "Jamaica", "Jordan", "Japan", "Kenya", "Kyrgyzstan", "Cambodia", "Kiribati", "Comoros", "St. Kitts & Nevis", "North Korea", "South Korea", "Kuwait", "Cayman Islands", "Kazakhstan", "Laos", "Lebanon", "St. Lucia", "Liechtenstein", "Sri Lanka", "Liberia", "Lesotho", "Lithuania", "Luxembourg", "Latvia", "Libya", "Morocco", "Monaco", "Moldova", "Montenegro", "St. Martin", "Madagascar", "Marshall Islands", "Macedonia", "Mali", "Myanmar [Burma]", "Mongolia", "Macau [China]", "Northern Mariana Islands", "Martinique", "Mauritania", "Montserrat", "Malta", "Mauritius", "Maldives", "Malawi", "Mexico", "Malaysia", "Mozambique", "Namibia", "New Caledonia", "Niger", "Norfolk Island", "Nigeria", "Nicaragua", "Netherlands", "Norway", "Nepal", "Nauru", "Niue", "New Zealand", "Oman", "Panama", "Peru", "French Polynesia", "Papua New Guinea", "Philippines", "Pakistan", "Poland", "St. Pierre & Miquelon", "Pitcairn Islands", "Puerto Rico", "Palestinian Territories", "Portugal", "Palau", "Paraguay", "Qatar", "Réunion", "Romania", "Serbia", "Russia", "Rwanda", "Saudi Arabia", "Solomon Islands", "Seychelles", "Sudan", "Sweden", "Singapore", "St. Helena", "Slovenia", "Svalbard & Jan Mayen", "Slovakia", "Sierra Leone", "San Marino", "Senegal", "Somalia", "Suriname", "South Sudan", "São Tomé & Príncipe", "El Salvador", "Sint Maarten", "Syria", "Swaziland", "Tristan da Cunha", "Turks & Caicos Islands", "Chad", "French Southern Territories", "Togo", "Thailand", "Tajikistan", "Tokelau", "Timor-Leste", "Turkmenistan", "Tunisia", "Tonga", "Turkey", "Trinidad & Tobago", "Tuvalu", "Taiwan", "Tanzania", "Ukraine", "Uganda", "U.S. Outlying Islands", "Uruguay", "Uzbekistan", "Vatican City", "St. Vincent & Grenadines", "Venezuela", "British Virgin Islands", "U.S. Virgin Islands", "Vietnam", "Vanuatu", "Wallis & Futuna", "Samoa", "Kosovo", "Yemen", "Mayotte", "South Africa", "Zambia", "Zimbabwe"]
    
    let states = ["Pick one",
                  "NA - Non Applicable",
                  "AK - Alaska",
                  "AL - Alabama",
                  "AR - Arkansas",
                  "AS - American Samoa",
                  "AZ - Arizona",
                  "CA - California",
                  "CO - Colorado",
                  "CT - Connecticut",
                  "DC - District of Columbia",
                  "DE - Delaware",
                  "FL - Florida",
                  "GA - Georgia",
                  "GU - Guam",
                  "HI - Hawaii",
                  "IA - Iowa",
                  "ID - Idaho",
                  "IL - Illinois",
                  "IN - Indiana",
                  "KS - Kansas",
                  "KY - Kentucky",
                  "LA - Louisiana",
                  "MA - Massachusetts",
                  "MD - Maryland",
                  "ME - Maine",
                  "MI - Michigan",
                  "MN - Minnesota",
                  "MO - Missouri",
                  "MS - Mississippi",
                  "MT - Montana",
                  "NC - North Carolina",
                  "ND - North Dakota",
                  "NE - Nebraska",
                  "NH - New Hampshire",
                  "NJ - New Jersey",
                  "NM - New Mexico",
                  "NV - Nevada",
                  "NY - New York",
                  "OH - Ohio",
                  "OK - Oklahoma",
                  "OR - Oregon",
                  "PA - Pennsylvania",
                  "PR - Puerto Rico",
                  "RI - Rhode Island",
                  "SC - South Carolina",
                  "SD - South Dakota",
                  "TN - Tennessee",
                  "TX - Texas",
                  "UT - Utah",
                  "VA - Virginia",
                  "VI - Virgin Islands",
                  "VT - Vermont",
                  "WA - Washington",
                  "WI - Wisconsin",
                  "WV - West Virginia", 
                  "WY - Wyoming"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        countryPicker.dataSource = self
        countryPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func stateButtonPressed(_ sender: AnyObject) {
        isStateBtn = true
        statePicker.isHidden = false
        statePickerButton.isHidden = true
        buyNowButton.isHidden = true
        countryLabel.isHidden = true
        countryPickerButton.isHidden = true
    }
    @IBAction func countryButtonPressed(_ sender: AnyObject) {
        isStateBtn = false
        countryLabel.isHidden = true
        countryPickerButton.isHidden = true
        countryPicker.isHidden = false
        buyNowButton.isHidden = true
        statePickerButton.isHidden = true

    }
    @IBAction func buyNowButtonPressed(_ sender: AnyObject) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
        }
        
        if testFieldsComplete(){
            successImage.alpha = 0
            successImage.isHidden = false
            successImage.fadeIn()
            clearFields()
        }else{
            ErrorMsgP1.isHidden = false
            ErrorMsgP2.isHidden = false
        }
        goBackButton.isHidden = false
        
    }
    @IBAction func goBackButtonPressed(_ sender: AnyObject) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = false
        }
        statePicker.isHidden = true
        countryPicker.isHidden = true
        successImage.isHidden = true
        goBackButton.isHidden = true
        ErrorMsgP1.isHidden = true
        ErrorMsgP2.isHidden = true

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isStateBtn{
            return states.count
        }else{
            return countries.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isStateBtn{
            return states[row]
        }else{
            return countries[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if isStateBtn{
            statePickerButton.setTitle(states[row], for: UIControlState.normal)
            statePicker.isHidden = true
            statePickerButton.isHidden = false
            countryLabel.isHidden = false
            countryPickerButton.isHidden = false
            buyNowButton.isHidden = false
        }else{
            countryPickerButton.setTitle(countries[row], for: UIControlState.normal)
            countryLabel.isHidden = false
            countryPickerButton.isHidden = false
            countryPicker.isHidden = true
            statePickerButton.isHidden = false
            buyNowButton.isHidden = false
        }
    }
    func testFieldsComplete() -> Bool{
        if !(streetTextField.text?.isEmpty)! && !(cityTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! && statePicker.selectedRow(inComponent: 0) != 0 && countryPicker.selectedRow(inComponent: 0) != 0{
            return true
        }else{
            return false
        }
    }
    func clearFields(){
        streetTextField.text = ""
        nameTextField.text = ""
        cityTextField.text = ""
        countryPickerButton.setTitle("Pick your country", for: UIControlState.normal)
        statePickerButton.setTitle("Pick your state", for: UIControlState.normal)
        statePicker.selectRow(0, inComponent: 0, animated: false)
        countryPicker.selectRow(0, inComponent: 0, animated: false)
    }
}

