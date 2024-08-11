//
//  CodeVerificationViewModel.swift
//  wb_chat_2
//
//  Created by Halil Yavuz on 11.08.2024.
//

import SwiftUI

final class CodeVerificationViewModel: ObservableObject {
    
    @Published var verificationCode = Array(repeating: "", count: 4)
    @Published var generatedCode: String = ""
    @Published var isCodeCorrect: Bool = false
    @Published var showError: Bool = false
    @Published var displayedCode: String = ""
    
    private let codeLength = 4
    let notificationManager: NotificationManager
    
    init() {
        self.notificationManager = NotificationManager()
    }
    
    
    func generateVerificationCode() {
        let randomDigitSequence = RandomDigitSequence(length: codeLength)
        generatedCode = randomDigitSequence.joined()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.displayedCode = self.generatedCode
            self.notificationManager.scheduleNotification(code: self.generatedCode)
        }
        print("Сгенерированный код: \(generatedCode)")
    }
    
    private func checkCode() {
        let enteredCode = verificationCode.joined()
        isCodeCorrect = (enteredCode == generatedCode)
        if isCodeCorrect {
            print("Проверка кода: Успешно")
        } else {
            print("Проверка кода: Неудачно")
            showError = true
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showError = false
                self.verificationCode = Array(repeating: "", count: 4)
                // Вызов клавиатуры
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                
            }
        }
    }
    
    func handleTextFieldChange(for index: Int, newValue: String) -> Int? {
        // Проверяем, что текущий текстовый поле находится в фокусе
        guard index < verificationCode.count else { return nil }
        
        if newValue.isEmpty {
            // Если текущее поле пустое и это не первое поле, перемещаем фокус на предыдущее поле
            if index > 0 {
                return index - 1
            }
        } else if newValue.count > 1 {
            // Обработка вставки нескольких символов (например, при вставке)
            let endIndex = index + newValue.count
            
            if endIndex <= verificationCode.count {
                // Распределяем дополнительные символы по массиву
                verificationCode.replaceSubrange(index..<endIndex, with: newValue.map { String($0) })
                // Перемещаем фокус на последний вставленный символ
                return endIndex - 1
                
            } else {
                // Если введённое значение содержит больше одного символа, оставляем только первый символ в текущем текстовом поле.
                verificationCode[index] = String(newValue[newValue.startIndex])
            }
            
        }
        // Если текущий индекс - последний и поле не пустое, проверяем код и скрываем клавиатуру
        if index == verificationCode.count - 1 && newValue.count == 1 {
            checkCode()
            hideKeyboard()
        }
        return nil
    }
    
    private func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
