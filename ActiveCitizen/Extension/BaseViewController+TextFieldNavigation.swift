//
//  BaseViewController+TextFieldNavigation.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension BaseViewController {
    
    func textControlShouldBeginEditing(textControl: UITextField) -> Bool {
        
        self.currentTextField = textControl;

        let index = textControl.tag;
        let nextTextField = self.getTextControlWithTag(tag: index+1)
        let prevTextField = self.getTextControlWithTag(tag: index-1)
            
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)]
            
        let previousBarButton = UIBarButtonItem.init(title: " ◄ ", style: .plain, target: self, action: #selector(previousTextFieldAction))
        previousBarButton.isEnabled = prevTextField?.isEnabled ?? false;
        previousBarButton.setTitleTextAttributes(attributes, for: .normal)
        previousBarButton.setTitleTextAttributes(attributes, for: .highlighted)
        previousBarButton.setTitleTextAttributes(attributes, for: .disabled)
        previousBarButton.tintColor = UIColor.mainColor;
        
        let nextBarButton = UIBarButtonItem.init(title: " ► ", style: .plain, target: self, action: #selector(nextTextFieldAction))
        nextBarButton.isEnabled = nextTextField?.isEnabled ?? false;
        nextBarButton.setTitleTextAttributes(attributes, for: .normal)
        nextBarButton.setTitleTextAttributes(attributes, for: .highlighted)
        nextBarButton.setTitleTextAttributes(attributes, for: .disabled)
        nextBarButton.tintColor = UIColor.mainColor;
        
        let doneBarButton = UIBarButtonItem.init(title: "Готово", style: .done, target: self, action: #selector(resignKeyboard))
        doneBarButton.tintColor = UIColor.mainColor;
            
        let keyboardToolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40.0))
        keyboardToolBar.barStyle = .default;
            
        var barItems : [UIBarButtonItem] = []
        
        if((nextTextField != nil) || (prevTextField != nil)){
            barItems.append(previousBarButton)
            barItems.append(nextBarButton)
        }
        
        barItems.append(UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        barItems.append(doneBarButton)
        keyboardToolBar.setItems(barItems, animated: false)
        self.currentTextField?.inputAccessoryView = keyboardToolBar

        return true;
    }
    

    func textControlShouldReturn(textField: UITextField) -> Bool {
        
        if((textField as UITextField).returnKeyType == .next){
            self.nextTextFieldAction()
            return false;
        }
        
        if((textField as UITextField).returnKeyType == .done){
            resignKeyboard()
            return false;
        }
        
        return false
    }
        
    @objc private func nextTextFieldAction() {
        
        if(self.currentTextField != nil){
            
            let index = self.currentTextField!.tag
            let prevTextField = self.getTextControlWithTag(tag: index+1)
            //let oldTextControl = self.currentTextField
            prevTextField?.becomeFirstResponder()

            // TODO
            /*
            if(self.textControlChanged){
                self.textControlChanged(oldTextControl, prevTextField);
            }*/
        }
    }
    
    @objc private func previousTextFieldAction() {
        
        if(self.currentTextField != nil){
            
            let index = self.currentTextField!.tag
            let prevTextField = self.getTextControlWithTag(tag: index-1)
            //let oldTextControl = self.currentTextField
            prevTextField?.becomeFirstResponder()

            // TODO
            /*
            if(self.textControlChanged){
                self.textControlChanged(oldTextControl, prevTextField);
            }*/
        }
    }

    @objc private func resignKeyboard() {
        
        if(self.currentTextField != nil){
            self.currentTextField?.resignFirstResponder()
            self.currentTextField = nil;

            // TODO:
            /*
            if(self.keyboardResigned){
                self.keyboardResigned();
            }*/
        }
    }

    private func getTextControlWithTag(tag: Int) -> UIControl? {
        
        let view = self.view.viewWithTag(tag)
        if(view != nil && view!.responds(to: #selector(becomeFirstResponder))){
            return view as? UIControl;
        }
        return nil;
    }


//    -(BOOL)textControlShouldReturn:(UIView *)textControl {
//
//        if([textControl isKindOfClass:UITextField.class] || [textControl isKindOfClass:UITextView.class]){
//
//            if(((UITextField*)textControl).returnKeyType == UIReturnKeyNext){
//                [self nextTextField];
//                return NO;
//            }
//
//            [((UITextField*)textControl) resignFirstResponder];
//        }
//        return YES;
//    }

    
}
