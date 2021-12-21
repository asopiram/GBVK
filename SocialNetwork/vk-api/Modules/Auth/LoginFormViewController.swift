//
//  LoginFormViewController.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 29.11.2021.
//

import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad() // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)) // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()// Проверяем данные
        if !checkResult {// Если данные не верны, покажем ошибку
            showLoginError()
        }
        
        return checkResult // Вернем результат
    }
    
    
    func checkUserData() -> Bool {
        guard let login = loginInput.text,
              let password = passwordInput.text else {
                  return false
              }
        
        if login == "admin" && password == "123456" {
            return true
        } else {
            return false
        }
    }
    
    
    func showLoginError() { // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil) // Создаем кнопку для UIAlertController
        alter.addAction(action) // Добавляем кнопку на UIAlertController
        present(alter, animated: true, completion: nil) // Показываем UIAlertController
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {// Когда клавиатура появляется
        let info = notification.userInfo! as NSDictionary  // Получаем размер клавиатуры
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
    
    }
    
    
    @objc func keyboardWillBeHidden(notification: Notification) { //Когда клавиатура исчезает
        let contentInsets = UIEdgeInsets.zero  // Устанавливаем отступ внизу UIScrollView, равный 0
        scrollView?.contentInset = contentInsets
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil) // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil) // Второе — когда она пропадает
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)// исчезновение клавиатуры в портретной ориентации
    }


    @IBAction func loginButtonPressed(_ sender: Any) {//проверка пароля по нажатию кнопки
        let login = loginInput.text!
        // Получаем текст-пароль
        let password = passwordInput.text!
        // Проверяем, верны ли они
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }
    
    @IBAction func LogOut(segue: UIStoryboardSegue){
        
    }
    
    
}
