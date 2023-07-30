import UIKit

final class CustomView : UIView {
    // MARK: - UI Elements
    @IBOutlet weak var labelL: UILabel!
    @IBOutlet weak var imageVieww: UIImageView!
    // MARK: - Properties
    var userModel : UserModel! {
        didSet {
            imageVieww.image = userModel.userImages.first
            setWhiteBarStackView(barCount: userModel.userImages.count)
        }
    }
    var imageIndex = 0
    var whiteBarStackView = UIStackView()
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        imageVieww.fullSuperView()
                
        let panG = UIPanGestureRecognizer(target: self, action: #selector(panGTapped))
        addGestureRecognizer(panG)
        let tapG = UITapGestureRecognizer(target: self, action: #selector(tapGTapped))
        addGestureRecognizer(tapG)
    }
    // MARK: - Functions
    private func setWhiteBarStackView(barCount : Int) {
        addSubview(whiteBarStackView)
        _ = whiteBarStackView.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), boyut: .init(width: 0, height: 4))
        whiteBarStackView.spacing = 4
        whiteBarStackView.distribution = .fillEqually
        
        (0..<barCount).forEach { a in
            var bView = UIView()
            bView.backgroundColor = .white
            whiteBarStackView.addArrangedSubview(bView)
        }
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
    // MARK: - Actions
    @objc func tapGTapped(tapGesture : UITapGestureRecognizer) {
        let tapLocation = tapGesture.location(in: nil)
        
        if tapLocation.x > frame.width / 2 {
            imageIndex = imageIndex + 1 >= userModel.userImages.count ? 0 : imageIndex + 1
        } else {
            imageIndex = imageIndex - 1 < 0 ? userModel.userImages.count - 1 : imageIndex - 1
        }
        
        let willShowImage = userModel.userImages[imageIndex]
        imageVieww.image = willShowImage
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
    override func layoutSubviews() {
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
