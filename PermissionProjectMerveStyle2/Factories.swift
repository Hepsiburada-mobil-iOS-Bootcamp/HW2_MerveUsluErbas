

import UIKit




public func makeImageView(named: String) -> UIImageView {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    view.image = UIImage(named: named)
    
    //    let heightAnchorConstraint = view.heightAnchor.constraint(equalTo: view.widthAnchor)
    //    heightAnchorConstraint.priority = .defaultHigh
    //    heightAnchorConstraint.isActive = true
    
    // Stretch and grow
    view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
    view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
    
    return view
}

func makeButton(with text:String, fontAndSize:UIFont, type: ButtonColorType, colour: UIColor) -> UIButton {
    
    let button = UIButton()
    button.setTitle(text, for: .normal)
    button.titleLabel?.font = fontAndSize
    
    switch type {
    case .filled:
        button.backgroundColor = colour
        button.setTitleColor(.white, for: .normal)
    case .outlined:
        button.layer.borderColor = colour.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        button.setTitleColor(colour, for: .normal)
    }
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 0, height: 2)
    button.layer.shadowRadius = 4
    button.layer.shadowOpacity = 0.4
    button.layer.cornerRadius = 6
    //button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.widthAnchor.constraint(equalToConstant: 100).isActive = true

    return button
}

func makeContainer() -> UIView {
    
    
    let containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 6
    containerView.clipsToBounds = true
    return containerView
    
}


func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    //stackView.alignment = .fill
    stackView.spacing = 8.0
    
    stackView.alignment = .center
    
    return stackView
}

func makeShadowContainer() -> UIView  {
    let temp = UIView()
    temp.translatesAutoresizingMaskIntoConstraints = false
    temp.layer.shadowColor = UIColor.black.cgColor
    temp.layer.shadowOffset = CGSize(width: 0, height: 2)
    temp.layer.shadowRadius = 4
    temp.layer.shadowOpacity = 0.4
    temp.layer.cornerRadius = 6
    // temp.clipsToBounds = true
    return temp
}

func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.contentMode = .center
    label.textAlignment = .center
    
    return label
}

func makeSubLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    label.numberOfLines = 0 // multiline
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.contentMode = .center
    label.textAlignment = .center

    return label
}

func makeBoldLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 17)
    
    return label
}






