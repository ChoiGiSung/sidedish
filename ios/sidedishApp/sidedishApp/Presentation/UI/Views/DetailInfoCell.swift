//
//  DetailInfoCell.swift
//  sidedishApp
//
//  Created by 김지선 on 2021/04/22.
//

import UIKit
import Combine
import Toaster

class DetailInfoCell: UICollectionViewCell {
    class var reuseIdentifier: String {
        return "\(self)"
    }
    
    private var cancellables: Set<AnyCancellable> = []
    private var orderViewModel: OrderViewModelType!
    private var item: Detail!
    
    @IBOutlet weak var priceStackView: PriceStackView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var normalPriceLabel: UILabel!
    @IBOutlet weak var pointPriceLabel: UILabel!
    @IBOutlet weak var deliveryInfoLabel: UILabel!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!

    @IBAction func orderButtonTouched(_ sender: Any) {
        self.orderViewModel.order(quantity: orderViewModel.getOder().quantity, path: "side", path: 7)
    }

    @IBOutlet weak var eventBadgeStackView: UIStackView!
    
    @IBAction func addQuantityButtonTouched(_ sender: Any) {
        self.orderViewModel.plus(price: self.item.sellPrice())
    }
    
    @IBAction func subtractQuantituButtonTouched(_ sender: Any) {
        self.orderViewModel.minus(price: self.item.sellPrice())
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureCell(item: Detail) {
        nameLabel.text = item.getName()
        descriptionLabel.text = item.getDescription()
        orderButton.isEnabled = item.isPurchasable()
        
        if !item.isPurchasable() {
            orderButton.backgroundColor = .systemGray5
            orderButton.setTitle("일시품절", for: .disabled)
        }

        pointPriceLabel.text = "\(item.getPointRate() * item.sellPrice()/100)원"
        self.orderViewModel = OrderViewModel(order: (1, item.sellPrice()))
        
        self.item = item
        self.fetchOrderData()
        self.responseOrder()
        self.updateOrder()
        
        priceStackView.configureDetail(normalPrice: item.getNormalPrice(), salePrice: item.getSalePrice())
        
        for view in eventBadgeStackView.subviews {
            view.removeFromSuperview()
        }
        item.getEventBadgeList().forEach { eventBadge in
            let badgeLabel = BadgeLabel()
            badgeLabel.configureLabel(text: eventBadge.getName(), color: eventBadge.getColorHex())
            
            eventBadgeStackView.addArrangedSubview(badgeLabel)
        }
    }
    
    private func configureUI() {
        orderButton.layer.cornerRadius = 5
    }
    
    private func fetchOrderData() {
        self.orderViewModel.dataChanged
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.updateOrder()
            }
            .store(in: &cancellables)
    }
    
    private func updateOrder() {
        self.quantityLabel.text = "\(orderViewModel.getOder().quantity)"
        self.totalPriceLabel.text = "\(orderViewModel.getOder().amount)원"
    }
    
    private func responseOrder() {
        self.orderViewModel.responseChanged
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.updateResponseOrder()
            }
            .store(in: &cancellables)
    }
    
    private func updateResponseOrder() {
        if self.orderViewModel.getStatusCode() == 201 {
            Toast(text: "주문 가능합니다!").show()
        } else {
            Toast(text: "수량이 부족하여 주문 불가능합니다.").show()
        }
    }
}