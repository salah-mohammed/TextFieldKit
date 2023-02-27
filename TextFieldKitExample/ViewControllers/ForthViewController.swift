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

public class UoploadView:UIButton,FieldValiadtion{
    var filePicked:Data?=nil
    @IBOutlet weak var txtTitle:UILabel!

    public var messages: [TextFieldKit.FieldError]{
        if self.filePicked == nil {
            return [.required(self.title)]
        }
     return []
    }
    public var title: String{
     return "Id Photo"
    }
    public var error: String?{
        didSet{
            txtTitle?.text=error
        }
    }
    
}
public class ForthViewController: UIViewController {
    @IBOutlet public weak var txtAdvancedPhoneNumber:AdvancedPhoneNumber!=AdvancedPhoneNumber()
    @IBOutlet public weak var txtLocationTextField:LocationTextField!=LocationTextField()
    @IBOutlet public weak var txtTitle:TitleField!=TitleField()
    @IBOutlet public weak var txtFullName:FullNameField!=FullNameField()
    @IBOutlet public weak var txtRequirements:RequirementsField!=RequirementsField()
    @IBOutlet public weak var txtNewPassword:NewPasswordField!=NewPasswordField()
    @IBOutlet public weak var txtConfirmPassword:ConfirmPasswordField!=ConfirmPasswordField()
    @IBOutlet public weak var txtPasswordField:PasswordField!=PasswordField()
    @IBOutlet public weak var txtEmail:EmailField!=EmailField()
    @IBOutlet public weak var txtCity:CustomCityField!=CustomCityField()
    @IBOutlet public weak var viewUploadId:UoploadView!=UoploadView()
    @IBOutlet public weak var segmentedControl:UISegmentedControl!
    
    var userType:UserType?{
        didSet{
            if let userType:UserType=userType{
            self.segmentedControl.selectedSegmentIndex=userType.rawValue
            }
        }
    }
    // all
    public var allFields:[FieldValiadtion]{
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
    public var userFields:[FieldValiadtion]{
    return [
        txtFullName,
        txtPasswordField,
        txtNewPassword,
        txtConfirmPassword]
    }
    // companyCheck
    public var companyFields:[FieldValiadtion]{
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
    public var fields:[FieldValiadtion]{
        return  self.userType == .user ? self.userFields:self.companyFields
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
//        viewUploadId.clearError()
        self.fieldsManager.check(field:viewUploadId)
    }
    @IBAction func btnValid(_ sender:Any?){
        let all = self.fieldsManager.checkAll();
        if all.valid == false{
            all.showAlert(self, handler: nil);
        }
    }
//     init() {
//        super.init()
//    }
   
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
