import UIKit

final class HeaderView: UIView {
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoImageView, labelsStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            restaurantNameLabel, restaurantStatusLabel, restaurantOpenDaysLabel]
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
    
    private lazy var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Restaurant name"
        return label
    }()
    
    private lazy var restaurantStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Status"
        return label
    }()
    
    private lazy var restaurantOpenDaysLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Delivery"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    
    func updateView(restaurant: Restaurant) {
        logoImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        restaurantStatusLabel.text = restaurant.status
        restaurantOpenDaysLabel.text = restaurant.openDays
    }
}

private extension HeaderView {

    func setupViews() {
        backgroundColor = .white
        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(mainStackView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
