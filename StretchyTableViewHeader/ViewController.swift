//
//  ViewController.swift
//  StretchyTableViewHeader
//
//  Created by Sergey on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    let models : [String] = ["Glass Christmas Bubble", "Wood Snowflake", "Mini Christmas tree", "Gnome decoration", "Glass bird", "Christmas Pillow", "Snow Globe", "Christmas Candles", "Christmas Calendar", "Christmas Rugs", "Wall Decor", "Wall Art", "Glass Snowflakes", "Wood Hearts", "Christmas Tree", "Christmas Snowman", "Wood Deer"]
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let headerView = StretchyTableHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
        setDelegates()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
    }
    
    private func setInitialUI() {
        view.addSubview(tableView)
        view.addSubview(headerView)
        headerView.imageView.image = UIImage(named: "image")
        tableView.tableHeaderView = headerView
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - UITableViewDelegate and UITableViewDataSource Realization

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - UIScrollViewDelegate Realization

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView)
    }
    
}
