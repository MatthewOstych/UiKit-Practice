
import UIKit

class LogoView: UIView {
    //MARK: - init
    init() {
        super.init(frame: .zero)
        initalize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private constrans
    private enum UIConstrants {
        static let logoWidth: CGFloat = 110
        static let logoHeight: CGFloat = 40
    }
    //MARK: - Private properties
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "InstagramLogo")
        return view
    }()
    
}

private extension LogoView {
    func initalize() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIConstrants.logoWidth),
            imageView.heightAnchor.constraint(equalToConstant: UIConstrants.logoHeight)
        ])
            
        }
        
    }

