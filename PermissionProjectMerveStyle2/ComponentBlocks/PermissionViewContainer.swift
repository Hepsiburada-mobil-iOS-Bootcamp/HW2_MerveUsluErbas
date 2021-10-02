import UIKit


protocol PermissionViewDelegate{
    func permissionButtonClicked(sender: UIButton, type: String)
    func noPermissionButtonClicked(sender: UIButton)
}

class PermissionViewContainer : UIView {
    
    private var type: String = ""
    var delegate: PermissionViewDelegate?
    init(frame: CGRect = .zero, type:String ) {
        
        super.init(frame: frame)
        self.type = type
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        var colour = UIColor.white
        var text = ""
        var subText = ""
        var photoName = ""
        
        let buttonStack = makeStackView(withOrientation: .horizontal)
        buttonStack.spacing = 20
        let mainStack = makeStackView(withOrientation: .vertical)
        
        switch type {
        case "Camera":
            colour = UIColor.darkRed
            text = "Camera Permission"
            subText = "Would you please give us permission to use camera."
            photoName = "camera_"
        case "Photos":
            colour = UIColor.darkYellow
            text = "Photos Permission"
            subText = "Would you please give us permission to reach out your galery."
            photoName = "photos_"
        default:
            return
        }
        
        
        let positiveButton = makeButton(with: "OK!", fontAndSize: FontManager.semibold(24).value, type: .filled, colour: colour)
        positiveButton.addTarget(self, action: #selector(permissionClicked), for: .touchUpInside)
        let negativeButton = makeButton(with: "Not Now!", fontAndSize: FontManager.semibold(24).value, type: .outlined, colour: colour)
        negativeButton.addTarget(self, action: #selector(noPermissionClicked), for: .touchUpInside)
        let container = makeContainer()
        let title = makeLabel(withText: text)
        let subTitle = makeSubLabel(withText: subText)
        let textStack = makeStackView(withOrientation: .vertical)
        textStack.spacing = 25
        let albumImage = makeImageView(named: photoName)
        
        textStack.addArrangedSubview(title)
        textStack.addArrangedSubview(subTitle)
        subTitle.leadingAnchor.constraint(equalTo: textStack.leadingAnchor, constant: 20).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: textStack.trailingAnchor, constant: -20).isActive = true
        buttonStack.addArrangedSubview(negativeButton)
        buttonStack.addArrangedSubview(positiveButton)
        mainStack.addArrangedSubview(albumImage)
        mainStack.addArrangedSubview(textStack)
        mainStack.addArrangedSubview(buttonStack)
        container.addSubview(mainStack)
        mainStack.spacing = 10
        addSubview(container)
        
        NSLayoutConstraint.activate([
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 60),
            mainStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -60),
            mainStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            
        ])
        
    }
    
    @objc func permissionClicked(sender: UIButton) {
        
        if let delegate = delegate {
            delegate.permissionButtonClicked(sender: sender, type: type)
        }
    }
    
    @objc func noPermissionClicked(sender: UIButton) {
        
        if let delegate = delegate {
            delegate.noPermissionButtonClicked(sender: sender)
            
        }
    }
    
}
