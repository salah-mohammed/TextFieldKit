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
    var fieldObservations:[(Field?,NSKeyValueObservation?)]=[(Field?,NSKeyValueObservation?)]()

    @IBOutlet weak var lblError:UILabel!
    var field:UploadViewValidation?{
        didSet{
            
            self.fieldObservations.removeAll { item in return item.0 == oldValue}
            let observer1 = field?.observe(
                \.text,
                 options: [.old, .new]
             ) { object, change in
                 if change.newValue != self.lblError.text{
                     self.lblError.text = change.newValue ?? ""
                 }
             }
            let observer2 = observe(
                \.lblError?.text,
                 options: [.old, .new]
             ) { object, change in
                 if self.field?.error != change.newValue {
                     self.field?.error = change.newValue ?? ""
                 }
             }
            self.fieldObservations.append((field,observer1))
            self.fieldObservations.append((field,observer2))

        }
    }
    
}

public class UploadViewValidation:Field{
    var filePicked:Data?
    public override var messages: [TextFieldKit.FieldError]{
        if self.filePicked == nil {
            return [.required(self.title)]
        }
     return []
    }
    public override var title: String{
     return "Id Photo"
    }

}
public class ForthViewController: UIViewController {
    @IBOutlet public var txtAdvancedPhoneNumber:AdvancedPhoneNumber!{ didSet{
        txtAdvancedPhoneNumber.field=vmAdvancedPhoneNumber}}
    @IBOutlet public var txtLocationTextField:LocationTextField!{ didSet{
        txtLocationTextField.field=vmLocationTextField}}
    @IBOutlet public var txtTitle:TitleField!{ didSet{
        txtTitle.field=vmTitle}}
    @IBOutlet public var txtFullName:FullNameField!{ didSet{
        txtFullName.field=vmFullName}}
    @IBOutlet public var txtRequirements:RequirementsField!{ didSet{
        txtRequirements.field=vmRequirements}}
    @IBOutlet public var txtNewPassword:NewPasswordField!{ didSet{
        txtNewPassword.field=vmNewPassword}}
    @IBOutlet public var txtConfirmPassword:ConfirmPasswordField!{ didSet{
        txtConfirmPassword.field=vmConfirmPassword}}
    @IBOutlet public var txtPasswordField:PasswordField!{ didSet{
        txtPasswordField.field=vmPasswordField}}
    @IBOutlet public var txtEmail:EmailField!{ didSet{
        txtEmail.field=vmEmail}}
    @IBOutlet public var txtCity:CustomCityField!{ didSet{
        txtCity.field=vmCity}}
    @IBOutlet public var viewUploadId:UoploadView!
    { didSet{
        viewUploadId.field=vmViewUploadId}}

    
    public var vmAdvancedPhoneNumber:AdvancedPhoneNumberValidation = AdvancedPhoneNumberValidation.init()
    public var vmLocationTextField:LocationTextFieldValidation=LocationTextFieldValidation()
    public var vmTitle:TitleFieldValidation=TitleFieldValidation()
    public var vmFullName:FullNameFieldValidation=FullNameFieldValidation()
    public var vmRequirements:RequirementsFieldValidation=RequirementsFieldValidation()
    public var vmNewPassword:NewPasswordValidation=NewPasswordValidation()
    lazy public var vmConfirmPassword:ConfirmPasswordFieldValidation=ConfirmPasswordFieldValidation.init(vmNewPassword)
    public var vmPasswordField:PasswordFieldValidation=PasswordFieldValidation()
    public var vmEmail:EmailFieldValidation=EmailFieldValidation()
    public var vmCity:CustomCityFieldValidation=CustomCityFieldValidation()
    public var vmViewUploadId:UploadViewValidation=UploadViewValidation()
    
    
    
    @IBOutlet public var segmentedControl:UISegmentedControl?
    
    var userType:UserType?{
        didSet{
            if let userType:UserType=userType{
            self.segmentedControl?.selectedSegmentIndex=userType.rawValue
            }
        }
    }
    // all
    public var allFields:[FieldValiadtion]{
         [vmAdvancedPhoneNumber,
         vmLocationTextField,
         vmTitle,
         vmFullName,
         vmRequirements,
         vmPasswordField,
         vmNewPassword,
         vmConfirmPassword,
         vmEmail,
         vmCity,
         vmViewUploadId]
    }
    // userCheck
    public var userFields:[FieldValiadtion]{
        return [vmFullName,
                vmPasswordField,
                vmNewPassword,
                vmConfirmPassword]
    }
    // companyCheck
    public var companyFields:[FieldValiadtion]{
        return [vmAdvancedPhoneNumber,
        vmLocationTextField,
        vmFullName,
        vmPasswordField,
        vmNewPassword,
        vmConfirmPassword,
        vmEmail,
        vmTitle,
        vmCity,
        vmRequirements,
        vmViewUploadId]
    }
    // currentCheck
    public var fields:[FieldValiadtion]{
        return  (self.userType == .user ? self.userFields:self.companyFields)
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
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.setupFields()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
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
        viewUploadId.field?.filePicked = Data();
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
        setupFields();
        txtFullName.fieldDidEnd = { _ in

        }
        txtCity.dropDownHandler = { textfield in
            self.vmCity.object = "Cairo";
        }
    }
    func fetchData(){
        
    }
}
// MARK: - Networking Methods
extension ForthViewController{
    func setupFields(){
        self.fieldsManager.fieldsHandler={
            return self.allFields
        }
        self.fieldsManager.requiredFieldsHandler={
            return self.fields
        }
        self.userType = .user;

    }
}
