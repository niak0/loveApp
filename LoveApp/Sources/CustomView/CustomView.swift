import UIKit
protocol CustomViewDelegate: AnyObject {
    func userModelDidUpdateInCustomView(_ userModel: CustomViewModel)
}

final class CustomView : UIView {
    // MARK: - UI Elements
    @IBOutlet weak var userImageView: UIImageView!
    // MARK: - Properties
    var customViewDelegate: CustomViewDelegate?
    var userModel : CustomViewModel! {
        didSet {
            if let _ = userModel.model as? AdsModel {
                self.moreInfoButton.isHidden = true
                self.whiteBarStackView.isHidden = true
            }
            setWhiteBarStackView(barCount: userModel.photos.count)
            userImageView.image = userModel.photos.first
            userInfoLabel.attributedText = userModel.infoAttrText
            userInfoLabel.textAlignment = userModel.textAligment
            userModel.delegate = self
        }
    }
    
    var imageIndex = 0
    var whiteBarStackView = UIStackView()
    let gradientLayer = CAGradientLayer()
    let userInfoLabel = UILabel()
    lazy var moreInfoButton : UIButton = {
        let btn = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium) // 30 puan büyüklüğünde sembol
        let infoImage = UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfiguration)
        btn.setImage(infoImage, for: .normal)
        btn.contentHorizontalAlignment = .center
        btn.contentVerticalAlignment = .center
        btn.tintColor = UIColor.purple
        btn.addTarget(self, action: #selector(moreInfoButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        //sıralamayı bozma önemli!
        commonInit()
        userImageView.fullSuperView()
        makeGradiant()
        setLayouts()
                
        let panG = UIPanGestureRecognizer(target: self, action: #selector(panGTapped))
        addGestureRecognizer(panG)
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGTapped))
        addGestureRecognizer(tapG)
    }
    // MARK: - Functions
    @objc func moreInfoButtonTapped() {
        customViewDelegate?.userModelDidUpdateInCustomView(self.userModel)
    }
    private func setImageIndexOberving() { // burada imageIndex değişkeni değiştiğinde çalıştırılacak olan kodları tanımlıyoruz. Bu kodlar, imageIndexObserver closure'una atanır ve bu closure, imageIndex değişkeninin değeri değiştiğinde çağrılır.
//        userModel.imageIndexObserver = {[weak self] (imageIndex, image) in
//            self?.userImageView.image = image
//            self?.whiteBarStackView.arrangedSubviews.forEach { sView in //ekrana her basıldıgında tüm barlar gri olucak
//                sView.backgroundColor = .gray
//            }
//            self?.whiteBarStackView.arrangedSubviews[imageIndex].backgroundColor = .white // her seferinde seçili index'in barı beyaz olucak
//            
//        }
    }
    private func makeGradiant() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7,1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: userImageView.bounds.width, height: userImageView.bounds.height)
        layer.addSublayer(gradientLayer)
    }
    private func setWhiteBarStackView(barCount : Int) {
        addSubview(whiteBarStackView)
        _ = whiteBarStackView.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), boyut: .init(width: 0, height: 4))
        whiteBarStackView.spacing = 4
        whiteBarStackView.distribution = .fillEqually
        
        (0..<barCount).forEach { a in
            let bView = UIView()
            bView.backgroundColor = .gray
            whiteBarStackView.addArrangedSubview(bView)
        }
        whiteBarStackView.arrangedSubviews.first?.backgroundColor = .white
    }
    
    private func panChanged(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: nil)
        let degree : CGFloat = translation.x / 5
        let radianAngle = (degree + .pi ) / 180
        let rotationTransform = CGAffineTransform(rotationAngle: radianAngle)
        self.transform = rotationTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    private func panEnded(_ panGesture : UIPanGestureRecognizer) {
        let rotationDirection: CGFloat = panGesture.translation(in: nil).x > 0 ? 1 : -1 // viewi sağa götürürsen pozitif sola götürürsen negatif olur
        let thresholdValue: CGFloat = 150
        let profileHidden : Bool = abs(panGesture.translation(in: nil).x) > thresholdValue // burada mutlak değer aldık çünkü sola götürünce hep eksi olacağı için hep false dönecekti şu an o düzeldi
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: .curveEaseOut,
        animations:  {
            print("animation showing, will call completion")
            if profileHidden {
                let offScreenTransform = self.transform.translatedBy(x: 600 * rotationDirection, y: 0) //view sağa veya sola doğru yok oldu
                self.transform = offScreenTransform
            } else {
                self.transform = .identity
            }
            
        }) { (_) in
            print("animation ended")
            if profileHidden {
                self.removeFromSuperview() //viewin gittiğinden emin olalım
            }
        }
    }
    private func setLayouts() {
        addSubview(userInfoLabel)
        userInfoLabel.textColor = .white
        userInfoLabel.numberOfLines = 0
        _ = userInfoLabel.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 10, bottom: 5, right: 0))
        
        addSubview(moreInfoButton)
        _ = moreInfoButton.anchor(top: nil, bottom: bottomAnchor, leading: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 20, right: 15))
    }

    // MARK: - Actions

    @objc func tapGTapped(tapGesture : UITapGestureRecognizer) {
        let tapLocation = tapGesture.location(in: nil)
        
        if tapLocation.x > frame.width / 2 {
            userModel.nextPhoto()
        } else {
            userModel.previousPhoto()
        }
    }

    @objc func panGTapped(panGesture : UIPanGestureRecognizer) {
        switch panGesture.state {
        case .changed:
            panChanged(panGesture)
        case .ended:
            panEnded(panGesture)
        default:
            break
        }
    }
    
    private func commonInit(){
        guard let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView else {
                    fatalError("Could not load CustomView from nib")
                }
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
extension CustomView : CustomViewModelDelegate {
    func imageIndexDidUpdate(_ index: Int, _ image: UIImage) {
        self.userImageView.image = image
        self.whiteBarStackView.arrangedSubviews.forEach { sView in //ekrana her basıldıgında tüm barlar gri olucak
        sView.backgroundColor = .gray
            }
        self.whiteBarStackView.arrangedSubviews[index].backgroundColor = .white // her seferinde seçili index'in barı beyaz olucak
    }
}
