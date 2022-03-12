import UIKit // Hata verebilir Telefon seçili olmadıgı için


public class TRKCLCheckBox : UIControl { // Controllerle ilgili base clas UIControl .

    private weak var chechkBoxImageView : UIImageView!
    private var checkBoxImage :UIImage { // Bu değişkenin ne yapacagını curly bracket ile verebiliriyoruz
        return checkhed ? UIImage(named: "check")! : UIImage(named: "uncheck")!
        
    }
    // Open override edilebilir , Public ise erişilebilir .
    // Eğer Open değilde public yaparsak erişilir ama değiştirilmez .
    open var checkhed : Bool = false { // open kullanıcı erişebilir ve dilerse değiştirebilir checkhed durumunu . Yanı kütüphaneyi kullanıcak kişi
        didSet {
            chechkBoxImageView.image = checkBoxImage
        }
    }
    
    public override init(frame : CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = checkBoxImage
        self.checkboxImageView = imageView
        backgroundColor = .clear
        
        addTarget(self, action: #selector(clickCheckBox), for: .touchUpInside)
        
    }
    
    @objc func clickCheckBox() {
        checkhed = !checkhed
        sendActions(for: .valueChanged) // değer değişince
    }
    
}
