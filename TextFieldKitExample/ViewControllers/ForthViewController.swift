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

public class UoploadView:UIButton{
    @IBOutlet weak var txtTitle:UILabel!
    var filePicked:Data?
    var field:Field?
    
}

public class UploadViewValidation:Field{
    public override var messages: [TextFieldKit.FieldError]{
        if self.filePicked == nil {
            return [.required(self.title)]
        }
     return []
    }
    public override var title: String{
     return "Id Photo"
    }
    public override var error: String?

}
public class ForthViewController: UIViewController {
    @IBOutlet public var txtAdvancedPhoneNumber:AdvancedPhoneNumber!
    @IBOutlet public var txtLocationTextField:LocationTextField!
    @IBOutlet public var txtTitle:TitleField!
    @IBOutlet public var txtFullName:FullNameField!
    @IBOutlet public var txtRequirements:RequirementsField!
    @IBOutlet public var txtNewPassword:NewPasswordField!
    @IBOutlet public var txtConfirmPassword:ConfirmPasswordField!
    @IBOutlet public var txtPasswordField:PasswordField!
    @IBOutlet public var txtEmail:EmailField!
    @IBOutlet public var txtCity:CustomCityField!
    @IBOutlet public var viewUploadId:UoploadView!
    @IBOutlet public var segmentedControl:UISegmentedControl!
    
    var userType:UserType?{
        didSet{
            if let userType:UserType=userType{
            self.segmentedControl.selectedSegmentIndex=userType.rawValue
            }
        }
    }
    // all
    public var allFields:[FieldValiadtion?]=[FieldValiadtion?]()
    // userCheck
    public var userFields:[FieldValiadtion?]{
        return [txtFullName.field,
                txtPasswordField.field,
                txtNewPassword.field,
                txtConfirmPassword.field]
    }
    // companyCheck
    public var companyFields:[FieldValiadtion?]{
        return [txtAdvancedPhoneNumber.field,
        txtLocationTextField.field,
        txtFullName.field,
        txtPasswordField.field,
        txtNewPassword.field,
        txtConfirmPassword.field,
        txtEmail.field,
        txtTitle.field,
        txtCity.field,
        txtRequirements.field,
        viewUploadId.field]
    }
    // currentCheck
    public var fields:[FieldValiadtion]{
        return  (self.userType == .user ? self.userFields:self.companyFields).compactMap({$0})
    }
    public var fieldsManager:FieldsManager = FieldsManager();
    public static var copy:ForthViewController{
        return  ForthViewController(nibName: nil, bundle: nil)
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
        localized();
        setupData();
        fetchData();

        // Do any additional setup after loading the view.
    }
    public override func viewDidAppear(_ animated: Bool) {
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
        if let field:Field = viewUploadId.field{
            self.fieldsManager.check(field:field)
        }
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
        (self.txtConfirmPassword.field as? ConfirmPasswordFieldValidation)?.newPasswordValidation=self.txtNewPassword.field as? NewPasswordValidation
        self.fieldsManager.fieldsHandler={
            return self.allFields.compactMap({$0})
        }
        self.fieldsManager.requiredFieldsHandler={
            return self.fields.compactMap({$0})
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
    func setupFields(){
        txtAdvancedPhoneNumber.field = AdvancedPhoneNumberValidation()
        txtLocationTextField.field = LocationTextFieldValidation()
        txtFullName.field = FullNameFieldValidation()
        txtPasswordField.field = PasswordFieldValidation()
        txtNewPassword.field = NewPasswordValidation()
        txtConfirmPassword.field = ConfirmPasswordFieldValidation()
        txtEmail.field = EmailFieldValidation()
        txtTitle.field = TitleFieldValidation()
        txtCity.field = CityFieldValidation()
        txtRequirements.field = RequirementsFieldValidation()
        viewUploadId.field = UploadViewValidation()
    }
}
