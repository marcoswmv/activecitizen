//
//  BaseViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, UITextFieldDelegate, NVActivityIndicatorViewable {

    // MARK: - Variables
    
    /// Automatic authentication check. Logout if needed
    @IBInspectable var authenticationRequred = true
    
    /// Hide navigation bar back button
    //@IBInspectable var hideBackButton = false
    
    /// Hide navigation bar
    @IBInspectable var hideNavigationBar = false
    
    /// Hide tab bar
    @IBInspectable var hideTabBar = false
    
    /// Enable navigation via keyboard toolbar. Movement based on UITexField tags. Don't forget set tags
    @IBInspectable var textFieldNavigation = false
    
    /// Automaticly change scrollView insets and keyboardheightConstraint depends of keyboad state. Don't forget set IBOutlet contentScrollView or/and keyboardheightConstraint
    // @IBInspectable var keyboardManagment = false
    
    // TODO
    
    //    -(void)setKeyboardManagment:(BOOL)keyboardManagment {
    //
    //        if(_keyboardManagment != keyboardManagment){
    //            if(keyboardManagment){
    //                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    //            }else{
    //                [[NSNotificationCenter defaultCenter] removeObserver:self];
    //            }
    //            _keyboardManagment = keyboardManagment;
    //        }
    //    }
    

    /// Is view is stil appearing. (Beyound WillAppear and DidAppear)
    private(set) var viewWillAppearInProgress = false
    
    /// Is screen is visible
    var isVisible: Bool  {
        get {
            return self.isViewLoaded && ((self.view?.window) != nil);
        }
    }
    
    /// Keyboard height if keyboard is present
    private(set) var keyboardHeight: CGFloat = 0.0
    
    /// Current textfield for textfield navigation
    var currentTextField: UITextField?
    
    
    // MARK: - Init, Appear, Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extendedLayoutIncludesOpaqueBars = true

        // Session
        // TODO: logout
        //NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: LogoutNotification, object: nil)


        // Default back button
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if let font = UIFont(name: UIFont.regularFontFmily, size: 16.0) {
            backButton.setTitleTextAttributes([
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.white
            ], for: .normal)
        }
        navigationItem.backBarButtonItem = backButton
        
        // TODO: back icon
        //navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back-button-with-padding")
        //navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back-button-with-padding")


        // navigationController?.navigationBar.shadowImage = UIImage() Remove shadow
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewWillAppearInProgress = true;
        super.viewWillAppear(animated)
        
        // Hide / show s navigation / tab bar
        self.navigationController?.setNavigationBarHidden(self.hideNavigationBar, animated: true)
        self.tabBarController?.tabBar.isHidden = self.hideTabBar
        // TODO: animation. See UITabBarController+Animation
           
        // Auth
        // TODO: Logout
        //        if(!SessionStorage.shared.isAuthorized && self.authenticationRequred){
        //               [LogoutManager logout];
        //               return;
        //        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewWillAppearInProgress = false;
    }
    
    /*
    -(void)didLogout {
        if(self.isVisible && self.authenticationRequred){
            UIViewController *vc = [UIStoryboard storyboardWithName:@"Authorization" bundle:nil].instantiateInitialViewController;
            UIApplication.sharedApplication.delegate.window.rootViewController = vc;
        }
    }*/

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent;
    }
    
    // MARK: - UI
    func displayLoading(loading: Bool, color: UIColor = .white) {
        UIApplication.displayLoading(loading: loading, color: color)
    }
    
    // MARK: - Instantiate

    class func storyboardName() -> String? {
        // Override me
        return "Main"
    }

    class func instantiate() -> BaseViewController {

        let storyboard = UIStoryboard(name: self.storyboardName() ?? "", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? BaseViewController
        assert(vc != nil, "Cannot find \(NSStringFromClass(self.self)) in \(self.storyboardName() ?? "").storyboard")
        return vc!
    }

    // MARK: - TextField navigation
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(self.textFieldNavigation){
            return self.textControlShouldBeginEditing(textControl: textField)
        }
        
        return true;
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(self.textFieldNavigation){
            return self.textControlShouldReturn(textField: textField)
        }
        textField.resignFirstResponder();
        return false;
    }

    
    // MARK: - Keyboard managment

    func keyboardWillShow(sender: NSNotification) {
        /*
        CGFloat height = [[sender.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        _keyboardHeight = height;
        
        if(self.tabBarController.tabBar && !self.tabBarController.tabBar.hidden){
            height -= self.tabBarController.tabBar.frame.size.height;
        }
        
        NSTimeInterval duration = [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        if(self.keyboardheightConstraint){
            self.keyboardheightConstraint.constant = height;
        }
        
        [UIView animateWithDuration:duration animations:^{
            //  ilya fedorov: fix for iPhone 6+ (10.0.1). This device have non-zero .contentInset.top value before keyboard will shown
            UIEdgeInsets edgeInsets = self.contentScrollView.contentInset;//UIEdgeInsetsMake(0, 0, height + 20, 0);
            edgeInsets.bottom = height + 20;
            if(self.contentScrollView){
                self.contentScrollView.contentInset = edgeInsets;
                self.contentScrollView.scrollIndicatorInsets = edgeInsets;
            }
            
            if(self.keyboardheightConstraint && !self.viewWillAppearInProgress){
                [self.view layoutSubviews];
            }
        }];*/
    }
    
    func keyboardWillHide(sender: NSNotification) {
        
        /*
        NSTimeInterval duration = [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        _keyboardHeight = 0;
        
        if(self.keyboardheightConstraint){
            self.keyboardheightConstraint.constant = 0;
        }
        
        [UIView animateWithDuration:duration animations:^{
            //  ilya fedorov: fix for iPhone 6+ (10.0.1)
            UIEdgeInsets edgeInsets = self.contentScrollView.contentInset;//UIEdgeInsetsZero;
            edgeInsets.bottom = 0;  //  possible problem for iPhone 6+ (10.0.1) because this device have non-zero .contentInset.bottom value before keyboard will shown
            if(self.contentScrollView){
                self.contentScrollView.contentInset = edgeInsets;
                self.contentScrollView.scrollIndicatorInsets = edgeInsets;
            }
            
            if(self.keyboardheightConstraint && !self.viewWillAppearInProgress){
                [self.view layoutSubviews];
            }
        }];
         */
    }
    
    deinit {
        //[[NSNotificationCenter defaultCenter] removeObserver:self];
    }

}
