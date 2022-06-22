//
//  NextPageViewController.swift
//  AllOverAgain
//
//  Created by Ruslan on 21/06/22.
//

import UIKit

class NextPageViewController: UIViewController {

    var array: [Info] = [Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic1")!, isLiked: false),
                         Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic2")!, isLiked: false),
                         Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic5")!, isLiked: false),
                         Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic6")!, isLiked: false),
                         Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic3")!, isLiked: false),
                         Info(header: "Header", description: "He will want to use your yacht, and I dont't want this thing smelling like fish", time: "8m ago", image: UIImage(named: "pic4")!, isLiked: false)]
    
    var name: String!
    var image: UIImage!
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Green
        return view
    }()
    
   lazy var centralImage: UIImageView = {
        let pic = UIImageView()
        pic.image = image
        pic.contentMode = .scaleAspectFill
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 79
        pic.layer.borderWidth = 4
        pic.layer.borderColor = UIColor.systemBackground.cgColor
        return pic
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.font = Fonts.ThonburiBold30
        label.textColor = .black
        return label
    }()
    
    var underNameLabel: UILabel = {
        let label = UILabel()
        label.text = "A mantra goes here"
        label.font = Fonts.ThonburiLight16
        label.textColor = .black
        return label
    }()
    
    var buttonPosts: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(Colors.Green, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .highlighted)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = Fonts.ThonburiLight16
        button.backgroundColor = UIColor.systemBackground
        return button
    }()
    
    var buttonPhotos: UIButton = {
        let button = UIButton()
        button.setTitle("Photos", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .highlighted)
        button.layer.cornerRadius = 22
        button.titleLabel?.font = Fonts.ThonburiLight16
        return button
    }()
    
    lazy var viewForButtons: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Gray
        view.layer.cornerRadius = 25
        view.addSubview(buttonPosts)
        view.addSubview(buttonPhotos)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [viewForButtons])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 25
        stackView.spacing = 5
        return stackView
    }()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.ID)
        table.rowHeight = 80
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    var circle1: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Green
        view.layer.cornerRadius = 16
        return view
    }()
    
    var circle2: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    var circle3: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    var circle4: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    var circle5: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Gray
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var viewForCircles: UIView = {
        let view = UIView()
        view.addSubview(circle1)
        view.addSubview(circle2)
        view.addSubview(circle3)
        view.addSubview(circle4)
        view.addSubview(circle5)
        return view
    }()
    
    lazy var circlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [viewForCircles])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(greenView)
        view.addSubview(centralImage)
        view.addSubview(nameLabel)
        view.addSubview(underNameLabel)
        view.addSubview(stackView)
        view.addSubview(tableView)
        view.addSubview(circlesStackView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.barTintColor = Colors.Green
        navigationItem.title = "Profile"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Fonts.ThonburiBold30!, NSAttributedString.Key.foregroundColor: UIColor.white]

        greenView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(0)
            make.height.equalTo(245)
        }
        
        centralImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(128)
            make.width.height.equalTo(158)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(centralImage.snp_bottomMargin).inset(-20)
        }
        
        underNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp_bottomMargin).inset(-8)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(underNameLabel.snp_bottomMargin).inset(-24)
            make.width.equalTo(346)
            make.height.equalTo(50)
        }
        viewForButtons.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(stackView)
            make.width.equalTo(stackView)
            make.height.equalTo(stackView)
        }
        
        buttonPosts.snp.makeConstraints { make in
            make.centerY.equalTo(viewForButtons)
            make.left.equalTo(viewForButtons).inset(3)
            make.width.equalTo(168)
            make.height.equalTo(46)
        }
        
        buttonPhotos.snp.makeConstraints { make in
            make.centerY.equalTo(viewForButtons)
            make.right.equalTo(viewForButtons).inset(3)
            make.width.equalTo(168)
            make.height.equalTo(46)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp_bottomMargin).inset(-18)
            make.left.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(83)
        }
        
        circlesStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.left.right.equalToSuperview().inset(0)
            make.height.equalTo(83)
        }
        
        viewForCircles.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(circlesStackView)
            make.top.bottom.left.right.equalTo(circlesStackView).inset(0)
            make.height.equalTo(circlesStackView)
        }
        
        circle1.snp.makeConstraints { make in
            make.top.equalTo(viewForCircles).inset(14.5)
            make.right.equalTo(circle2.snp_leftMargin).inset(-40)
            make.width.height.equalTo(32)
        }
        
        circle2.snp.makeConstraints { make in
            make.top.equalTo(viewForCircles).inset(14.5)
            make.right.equalTo(circle3.snp_leftMargin).inset(-40)
            make.width.height.equalTo(32)
        }

        circle3.snp.makeConstraints { make in
            make.top.equalTo(viewForCircles).inset(14.5)
            make.centerX.equalTo(viewForCircles)
            make.width.height.equalTo(32)
        }

        circle4.snp.makeConstraints { make in
            make.top.equalTo(viewForCircles).inset(14.5)
            make.left.equalTo(circle3.snp_rightMargin).inset(-40)
            make.width.height.equalTo(32)
        }

        circle5.snp.makeConstraints { make in
            make.top.equalTo(viewForCircles).inset(14.5)
            make.left.equalTo(circle4.snp_rightMargin).inset(-40)
            make.width.height.equalTo(32)
        }
        
        buttonPhotos.addTarget(self, action: #selector(onPhotosTap), for: .touchUpInside)
        buttonPosts.addTarget(self, action: #selector(onPostsTap), for: .touchUpInside)
    }

    @objc func onPhotosTap() {
        buttonPhotos.backgroundColor = UIColor.systemBackground
        buttonPhotos.setTitleColor(Colors.Green, for: .normal)
        buttonPhotos.setTitleColor(UIColor.systemBlue, for: .highlighted)
        buttonPosts.backgroundColor = Colors.Gray
        buttonPosts.setTitleColor(UIColor.darkGray, for: .normal)
        buttonPosts.setTitleColor(UIColor.darkGray, for: .highlighted)
    }
    
    @objc func onPostsTap() {
        buttonPosts.backgroundColor = UIColor.systemBackground
        buttonPosts.setTitleColor(Colors.Green, for: .normal)
        buttonPosts.setTitleColor(UIColor.systemBlue, for: .highlighted)
        buttonPhotos.backgroundColor = Colors.Gray
        buttonPhotos.setTitleColor(UIColor.darkGray, for: .normal)
        buttonPhotos.setTitleColor(UIColor.darkGray, for: .highlighted)
    }
}

extension NextPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, sth) in
            self.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            sth(true)
        })
        
        let likeTitles = array[indexPath.row].isLiked == false ? "Like" : "Unlike"
        
        let likeAction = UIContextualAction(style: .normal, title: likeTitles, handler: {(action, value, sth) in
            var user = self.array[indexPath.row]
            user.isLiked.toggle()
            self.array[indexPath.row] = user
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            cell.info = user
            sth(true)
        })
        let user = array[indexPath.row]
        if user.isLiked == false {
            likeAction.backgroundColor = .link
        } else {
            likeAction.backgroundColor = .orange
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share", handler: {(action, value, sth) in
            let text = "Meet \(self.array[indexPath.row].header)"
            let image = self.array[indexPath.row].image
            let allTogether = UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
            
            self.present(allTogether, animated: true, completion: nil)
            sth(true)
        })
        shareAction.backgroundColor = UIColor.systemPurple
        
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction, likeAction, shareAction])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.ID, for: indexPath) as! CustomTableViewCell
        cell.info = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
