//
//  MainScreenViewModel.swift
//  OnlineBikeShopping
//
//  Created by DucLH11 on 06/02/2025.
//

import Combine
import Foundation

class MainScreenViewModel: ObservableObject {
    @Published var saleItems: [SaleItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func getData() {
        isLoading = true
        errorMessage = nil
        fakeFetchSaleItemFromApi()
            .receive(on: DispatchQueue.main)
//            .map({ items in
//
//            })
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = "Failed to fetch sale items: \(error.localizedDescription)"
                }
                self.isLoading = false
            }, receiveValue: { items in
                self.saleItems.append(contentsOf: items)
            })
            .store(in: &cancellables)
    }
    
    func fakeFetchSaleItemFromApi() -> Future<[SaleItem], Error> {
        return Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                let success = Bool.random()
                if success {
                    let newItems = [
                        SaleItem(name: "Road Bike", modelName: "PEUGEOT - LR01", price: "$1,999.99", isFavourite: true, imageUrl: "xedap2", description: "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain."),
                        SaleItem(name: "Road Helmet", modelName: "SMITH - TRADE", price: "$120", isFavourite: false, imageUrl: "mubaohiem", description: "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain."),
                        SaleItem(name: "Mountain Bike", modelName: "CANYON - MT20", price: "$2,500.00", isFavourite: false, imageUrl: "xedap2", description: "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain."),
                        SaleItem(name: "Gloves", modelName: "GIRO - WINTER", price: "$40", isFavourite: true, imageUrl: "mubaohiem", description: "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.")
                    ]
                    promise(.success(newItems))
                } else {
                    promise(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch sale items"])))
                }
            }
        }
    }
    
    func toggleFavorite(for item: SaleItem) {
        if let index = saleItems.firstIndex(where: { $0.id == item.id }) {
            saleItems[index].isFavourite.toggle()
        }
    }
    
    init() {
        getData()
    }
}
