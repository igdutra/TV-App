//
//  AdrianoController.swift
//  TVApp
//
//  Created by Ivo Dutra on 13/05/22.
//

import UIKit
import Combine

class AdrianoController: UITableViewController {
    private var models = [String]()
    
    private var observers: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.register(cellClass: AdrianoCell.self)
        // Com completion
//        AdrianoApi.shared.fetchData { [weak self] array in
//            self?.models = array
//        }
//        AdrianoApi.shared.fetchData()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print("done")
//                case .failure(let error):
//                    print(error, "errou!")
//                }
//            }, receiveValue: { [weak self] array in
//                self?.models = array
//                self?.tableView.reloadData()
//            }).store(in: &observers)
        
        // Com Async BEEEM MELHOR
        Task { [weak self] in
            await self?.loadModel()
        }
    }
    
    func loadModel() async {
        models = await AdrianoApi.shared.fetchDataAsync()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(cellClass: AdrianoCell.self, indexPath: indexPath) else {
            fatalError()
        }
        
        cell.setup(models[safe: indexPath.row] ?? "nao rolou")
        
        cell.action.sink { value in
            print("CHEKUT", value)
        }.store(in: &observers)
        
        return cell
    }
}

class AdrianoCell: UITableViewCell {
    let action = PassthroughSubject<String, Never>()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Se colocasse o cgrect no init, a celula ainda NAO teria o tamanho, 0, nao conseguindo fazer isso
        // NAO precisa de consrtiant pq qnd gira a tela ele já pega o width
        button.frame = CGRect(x: 10, y: 5, width: contentView.bounds.width - 20, height: contentView.bounds.height - 10)
    }
    
    @objc
    func tap() {
        action.send("CLICOU")
    }
}

class AdrianoApi {
    static let shared = AdrianoApi()
    
    func fetchDataCompletion(completion: @escaping ([String]) -> Void) {
        Timer.scheduledTimer(withTimeInterval: 3,
                             repeats: false) { _ in
            completion(["1", "2", "3"])
        }
    }
    
    func fetchData() -> Future<[String], ApiError> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(.success(["1", "2", "3", "4"]))
//                promise(.failure(.future))
            }
        }
    }
    
    func fetchDataAsync() async -> [String] {
        do {
            sleep(4)
        }
        return ["1", "2", "3", "4"]
    }
}
