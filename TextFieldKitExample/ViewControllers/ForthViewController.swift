//
//  ForthViewController.swift
//  TextFieldKitExample
//
//  Created by Salah on 11/25/21.
//

import UIKit
import TextFieldKit
enum UserType:Int{
case user=0
case company=1
}

class UoploadView:UIButton,FieldValiadtion{
    var filePicked:Data?=nil
    @IBOutlet weak var txtTitle:UILabel!

    var messages: [TextFieldKit.FieldError]{
        if self.filePicked == nil {
            return [.required(self.title)]
        }
     return []
    }
    var title: String{
     return "Id Photo"
    }
    var error: String?{
        didSet{
            txtTitle.text=error
        }
    }
    
}
class ForthViewController: UIViewController {
    @IBOutlet weak var txtAdvancedPhoneNumber:AdvancedPhoneNumber!
    @IBOutlet weak var txtLocationTextField:LocationTextField!
    @IBOutlet weak var txtTitle:TitleField!
    @IBOutlet weak var txtFullName:FullNameField!
    @IBOutlet weak var txtRequirements:RequirementsField!
    @IBOutlet weak var txtNewPassword:NewPasswordField!
    @IBOutlet weak var txtConfirmPassword:ConfirmPasswordField!
    @IBOutlet weak var txtPasswordField:PasswordField!
    @IBOutlet weak var txtEmail:EmailField!
    @IBOutlet weak var txtCity:CustomCityField!
    @IBOutlet weak var viewUploadId:UoploadView!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    var userType:UserType?{
        didSet{
            if let userType:UserType=userType{
            self.segmentedControl.selectedSegmentIndex=userType.rawValue
            }
        }
    }
    // all
    var allFields:[FieldValiadtion]{
    return [
    txtAdvancedPhoneNumber,
    txtLocationTextField,
    txtFullName,
    txtPasswordField,
    txtNewPassword,
    txtConfirmPassword,
    txtEmail,
    txtTitle,
    txtCity,
    txtRequirements,
    viewUploadId]
   }
    // userCheck
    var userFields:[FieldValiadtion]{
    return [
        txtFullName,
        txtPasswordField,
        txtNewPassword,
        txtConfirmPassword]
    }
    // companyCheck
    var companyFields:[FieldValiadtion]{
    return [
        txtAdvancedPhoneNumber,
        txtLocationTextField,
        txtFullName,
        txtPasswordField,
        txtNewPassword,
        txtConfirmPassword,
        txtEmail,
        txtTitle,
        txtCity,
        txtRequirements,
        viewUploadId]
    }
    // currentCheck
    var fields:[FieldValiadtion]{
        return  self.userType == .user ? self.userFields:self.companyFields
    }
    var fieldsManager:FieldsManager = FieldsManager();
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
        localized();
        setupData();
        fetchData();

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        

    }
    @IBAction func tapGesture(_ sender:Any){
        self.view.endEditing(true);
    }
    @IBAction func btnUserType(_ sender:UISegmentedControl){
        self.userType = UserType.init(rawValue:sender.selectedSegmentIndex)
        self.fieldsManager.clearErrors()
    }
    @IBAction func btnUploadFileId(_ sender:Any){
        viewUploadId.filePicked = Data();
//        viewUploadId.clearError()
        self.fieldsManager.checkField(field:viewUploadId)
    }
    @IBAction func btnValid(_ sender:Any?){
        let all = self.fieldsManager.checkAll();
        if all.valid == false{
            all.showAlert(self, handler: nil);
        }
    }
}

// MARK: - Base Methods
extension ForthViewController{
    func setupView(){
        txtCity.icon = UIImage.init(named:"ic_setting_phone")
        txtCity.dropDownIcon = UIImage.init(named:"ic_drop_down")
    }
    func localized(){
        txtCity.placeholder = "City";

    }
    func setupData(){
        self.fieldsManager.fieldsHandler={
            return self.allFields
        }
        self.fieldsManager.requiredFieldsHandler={
            return self.fields
        }
        self.userType = .user;
        txtFullName.fieldDidEnd = { _ in

        }
        txtCity.dropDownHandler = { textfield in
        self.txtCity.object = "Cairo";
        }
    }
    func fetchData(){
        
    }
}
// MARK: - Networking Methods
extension ForthViewController{
    
}
