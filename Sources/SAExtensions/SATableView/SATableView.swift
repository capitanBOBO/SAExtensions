import UIKit
import RickAndMortySwiftApi

// MARK: Protocols

public protocol SATableViewCellViewModel {
    var didTap: ((Int, Int)->())? { get set }
}

public protocol SATableViewCellView {
    associatedtype ViewModel
    var model: ViewModel? { get set }
}

// MARK: Cell

class SATableViewCell<View: SATableViewCellView>: UITableViewCell where View: UIView {
    static var reuseIdentifier: String {
        String(describing: View.self)
    }
    private var view = View().autolayout()

    var model: View.ViewModel? {
        didSet {
            view.model = model
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(view)
        view.pinSidesToSuperviewSides()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: TableView

public class SATableView<
    View: SATableViewCellView,
    ViewModel: SATableViewCellViewModel
>: UITableView where View.ViewModel == ViewModel, View: UIView {
    private typealias CellClass = SATableViewCell<View>

    private var tableViewHandler = SATableViewDelegate()
    public var sections: [[ViewModel]] = [] {
        didSet {
            reloadData()
        }
    }

    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = tableViewHandler
        self.dataSource = tableViewHandler
        tableViewHandler.numberOfSectionsCB = { self.sections.count }
        tableViewHandler.numberOfRowInSectionCB = { index in
            let section = self.sections[safe: index] ?? []
            return section.count
        }
        tableViewHandler.cellForRowCB = { indexPath in
            guard let cell = self.dequeueReusableCell(withIdentifier: CellClass.reuseIdentifier, for: indexPath) as? CellClass else { return UITableViewCell() }
            guard let section = self.sections[safe: indexPath.section], let item = section[safe: indexPath.row] else { return UITableViewCell() }
            cell.model = item
            return cell
        }
        tableViewHandler.didSelectRowCB = { indexPath in
            self.deselectRow(at: indexPath, animated: true)
            guard
                let section = self.sections[safe: indexPath.section],
                let model = section[safe: indexPath.row]
            else {
                return
            }
            model.didTap?(indexPath.section, indexPath.row)
        }
        self.register(CellClass.self, forCellReuseIdentifier: CellClass.reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
