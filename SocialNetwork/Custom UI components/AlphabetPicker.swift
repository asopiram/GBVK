//
//  AlphabetPicker.swift
//  SocialNetwork
//
//  Created by Дмитрий Шароваров on 12/15/21.
//
//Нужно переписать этот контрол на алфавит

import UIKit

enum Day: Int {//   создаем перечисление, содержащее все дни недели, каждый элемент будет иметь порядковый номер в неделе
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    static let allDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
    var title: String {//   переменная, которая возвращает сокращенное название дня
        switch self {
            case .monday: return "ПН"
            case .tuesday: return "ВТ"
            case .wednesday: return "СР"
            case .thursday: return "ЧТ"
            case .friday: return "ПТ"
            case .saturday: return "СБ"
            case .sunday: return "ВС"
        }
    }
}


@IBDesignable class AlphabetPicker: UIControl {//    используется для удобства расстановки кнопок, вместо констрейнтов
    var selectedDay: Day? = nil {// переменная для того, чтобы сохранить выбранный день в классе
        didSet {//  вызываем метод обновления каждый раз, как изменились свойства selectedDay
            self.updateSelectedDay()
            self.sendActions(for: .valueChanged)//  метод, который сообщает об изменении значения контрола
            
        }
        
    }
    
    
    private var buttons: [UIButton] = []//  храним массив кнопок
    private var stackView: UIStackView!
    
    
    override init(frame: CGRect) {//    вызываем метод setupView
        super.init(frame: frame)
        self.setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        
    }
    
    private func setupView() {//    метод, отвечающий за создание UIStackView и кнопок
        for day in Day.allDays {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            self.buttons.append(button)
            
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        self.addSubview(stackView)
    
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
    }
    
    private func updateSelectedDay() {//     метод, который обновляет интерфейс в соответствии с выбранной кнопкой
        for (index, button) in self.buttons.enumerated() {
            guard let day = Day(rawValue: index) else {
                continue
                
            }
            
            button.isSelected = day == self.selectedDay
            
        }
    }
    
    @objc private func selectDay(_ sender: UIButton) {//    обрабатываем нажатия на кнопки
        guard let index = self.buttons.index(of: sender) else {//   получаем индекс кнопки (который является номером дня)
            return
        }
        
        guard let day = Day(rawValue: index) else {//    пытаемся получить день, передав номер в инициализатор
            return
        }
        
        self.selectedDay = day
        
    }
    
    override func layoutSubviews() {// меняем frame взамен констрейнтов
        super.layoutSubviews()
        stackView.frame = bounds
        
    }
}
