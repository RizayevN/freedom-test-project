//
//  FMCardViewController.swift
//  freedom
//
//  Created by Nematzhon Rizayev on 04.09.2023.
//

import UIKit
import UltraDrawerView

struct FMCardSection {
    enum SectionType {
        case credit
        case info
        case transferHistory
        case transfers
        case details
    }

    enum RowType {
        case creditInfo
        case cardInfo
        case header(model: HeaderViewModel)
        case transferHistory(model: TransferInfoTableViewModel)
        case transfers(model: TransferTableViewModel)
    }
    
    let type: SectionType
    let rows: [RowType]
}

final class FMCardViewController: UIViewController {
    
    private lazy var sections: [FMCardSection] = [
        .init(type: .credit, rows: [.creditInfo]),
        .init(type: .info, rows: [.cardInfo])
    ]
    
    private let cardInfoHeaderView = CardInfoHeaderView()
    private let headerView = UIView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(CreditTableViewCell.self)
        tableView.register(CardInfoTableViewCell.self)
        tableView.register(TransferTableViewCell.self)
        tableView.register(HeaderTableViewCell.self)
        tableView.register(TransferInfoTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .fmShadow
        return tableView
    }()
    
    private lazy var drawerView = DrawerView(scrollView: tableView, headerView: headerView)
    
    private let transferService: TransferServiceProtocol
    
    init(transferService: TransferServiceProtocol) {
        self.transferService = transferService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        setupViews()
        setupTransferHistory()
        setupStaticCells()
    }
    
    override func viewDidLayoutSubviews() {
        drawerView.middlePosition = .fromBottom(
            view.frame.height - cardInfoHeaderView.calculateCardInfoHeaderViewHeight(), ignoresSafeArea: true
        )
    }
    
    private func setupTransferHistory() {
        transferService.getTransferHistory { [weak self] history in
            let transferHistory: [FMCardSection.RowType] = [
                .header(model: .init(title: "Последние операции", buttonTitle: "Все")),
            ] + history.map { .transferHistory(model: $0) }
            self?.sections.append(.init(type: .transferHistory, rows: transferHistory))
        }
        self.tableView.reloadData()
    }
    
    private func setupStaticCells() {
        let settingRows: [FMCardSection.RowType] = [
            .header(model: .init(title: "Настройки")),
            .transfers(model: .init(image: .fmBlock, title: "Заблокировать", controlType: .switcher)),
            .transfers(model: .init(image: .fmStar, title: "Основная карта", subtitle: "Для переводов по номеру телефона", controlType: .switcher)),
            .transfers(model: .init(image: .fmSuccessCard, title: "Лимиты")),
            .transfers(model: .init(image: .fmPin, title: "Изменить ПИН-код")),
            .transfers(model: .init(image: .fmPlasticCard, title: "Заказать пластиковую карту")),
            .transfers(model: .init(image: .fmFailCard, title: "Закрыть карту"))
        ]
        
        let detailRows: [FMCardSection.RowType] = [
            .header(model: .init(title: "Детали")),
            .transfers(model: .init(image: .fmBuilding, title: "Справки", subtitle: "О наличии счета и доступном остатке")),
            .transfers(model: .init(image: .fmPaper, title: "Условия кредита")),
            .transfers(model: .init(image: .fmPaper, title: "Договор")),
        ]
        sections.append(.init(type: .transfers, rows: settingRows))
        sections.append(.init(type: .details, rows: detailRows))
    }
    
    private func setupGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.colors = [
        UIColor(red: 0.017, green: 0.672, blue: 1, alpha: 1).cgColor,
        UIColor(red: 0.144, green: 0.349, blue: 0.616, alpha: 1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1, b: 1, c: -1, d: -0.89, tx: 1.5, ty: 0.45))
        gradient.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        gradient.position = view.center
        view.layer.addSublayer(gradient)
    }
    
    private func setupViews() {
        view.addSubview(cardInfoHeaderView)
        cardInfoHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        drawerView.availableStates = [.top, .middle]
        drawerView.cornerRadius = 16
        drawerView.containerView.backgroundColor = .white
        drawerView.setState(.middle, animated: false)

        view.addSubview(drawerView)
        drawerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: .fmBackButton, style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
        
        let customNavigationBar = UINavigationBar()
        
        let titleLabel = UILabel()
        titleLabel.text = "Freepay Card"
        titleLabel.font = Fonts.mediumParagraph
        titleLabel.textColor = .white
        
        let iconImageView = UIImageView(image: .fmEdit)
        customNavigationBar.addSubview(titleLabel)
        customNavigationBar.addSubview(iconImageView)
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(16)
            $0.left.equalTo(titleLabel.snp.right).offset(4)
            $0.top.bottom.equalToSuperview()
        }
        navigationItem.titleView = customNavigationBar
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: false)
    }
}

extension FMCardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .creditInfo:
            let cell: CreditTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel: .init(title: "Кредитный лимит", available: "138 379,95", maxAmount: "300 000"))
            return cell
        case .cardInfo:
            let cell: CardInfoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let bonusViewModel = FMSquareInfoViewModel(title: "12 000,47 ₸", subtitle: "Накоплено кешбэка", titleIcon: .fmGreenArrow, imageView: .fmFreedom)
            let cardViewModel = FMSquareInfoViewModel(title: "Реквизиты карты", subtitle: "4400 ** 3097", titleIcon: nil, imageView: .fmFreepayCard)
            cell.configure(bonusViewModel: bonusViewModel, cardViewModel: cardViewModel)
            return cell
        case .transfers(let model):
            let cell: TransferTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel: model)
            return cell
        case .header(let model):
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel: model)
            return cell
        case .transferHistory(let model):
            let cell: TransferInfoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections[indexPath.section].rows[indexPath.row] {
        case .cardInfo:
            return 118
        case .creditInfo:
            return 96
        case .transfers:
            return 54
        case .header:
            return 32
        case .transferHistory:
            return 67
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

