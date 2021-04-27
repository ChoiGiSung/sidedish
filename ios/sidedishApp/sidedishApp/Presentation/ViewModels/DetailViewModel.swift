//
//  DetailViewModel.swift
//  DetailApp
//
//  Created by zombietux on 2021/04/19.
//

import Foundation
import Combine

class DetailViewModel: DetailViewModelType {
    private var item = Detail()
    private(set) var dataChanged = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    private var detailUseCase: DetailUseCasePort!
    
    init(detailUseCase: DetailUseCasePort) {
        self.detailUseCase = detailUseCase
    }
    
    convenience init() {
        let detailUseCase = DetailUseCase()
        self.init(detailUseCase: detailUseCase)
    }
    
    func getDetailItem() -> Detail {
        return self.item
    }
    
    func getDetailImages() -> [Image] {
        return item.getDetailImages()
    }
    
    func getDescriptionImages() -> [Image] {
        return item.getDescriptionImages()
    }
    
    func fetchData(path category: String, path id: Int) {
        detailUseCase.getItem(path: category, path: id)
            .receive(on: DispatchQueue.global())
            .sink(receiveCompletion: { (result)
                    in switch result {
                    case .finished: break
                    case .failure(_): break } },
                  receiveValue: { item in
                    self.item = item
                    
                    self.dataChanged.send()
                  })
            .store(in: &cancellables)
    }
}
