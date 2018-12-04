//
//  BGGamePageViewController.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

class BGGamePageViewController: UIViewController {
    
    // UI
    var m_btnSetting: UIBarButtonItem?
    var m_lbStatus: UILabel?
    var m_cvBoard: UICollectionView?
    
    
    // variable
    var boardSize:Int = 0
    var goal:Int = 0
    var minNum:Int = 0
    var maxNum:Int = 0
    var board = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSet()
        bindUI()

    }
    
    private func bindUI() {
        m_btnSetting?.action = #selector(self.clickSetting)
        
    }
    
    
    // UI Drawing
    private func viewSet() {
        self.view.backgroundColor = UIColor.white
        self.title = "Game Page"
        settingBtnSet()
        boardViewSet()
        statusLabelSet()
    }
    
    private func settingBtnSet() {
        m_btnSetting = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = m_btnSetting
    }
    
    private func statusLabelSet() {
        m_lbStatus = UILabel(frame: CGRect(x: 10, y: 100, width: self.view.frame.width - 30, height: 40))
        m_lbStatus!.text = "Set the game first !!"
        m_lbStatus!.textColor = UIColor.darkGray
        self.view.addSubview(m_lbStatus!)
    }
    private func boardViewSet() {
        let defaultBoard: UIView = UIView(frame: CGRect(x: 5, y: 180, width: self.view.frame.width - 10, height: self.view.frame.width - 10))
        defaultBoard.backgroundColor = UIColor.gray
        self.view.addSubview(defaultBoard)
        
    }
    
    // Function
    @objc private func clickSetting() {
        let m_vcSetPage = BGSettingViewController()
        m_vcSetPage.setDelegate = self
        self.navigationController?.pushViewController(m_vcSetPage, animated: true)
    }
    
    private func createBoard() {
        let layout = UICollectionViewFlowLayout()
        m_cvBoard = UICollectionView(frame: CGRect(x: 5, y: 180, width: self.view.frame.width - 10, height: self.view.frame.width - 10), collectionViewLayout: layout)
        print("Board size:\(String(describing: m_cvBoard?.frame.width))")
        m_cvBoard?.register(BGBoardCell.self, forCellWithReuseIdentifier: "Cell")
        m_cvBoard!.backgroundColor = UIColor.gray
        self.view.addSubview(m_cvBoard!)
        self.m_cvBoard?.delegate = self
        self.m_cvBoard?.dataSource = self
        self.board.removeAll()
        self.board = [Bool](repeating: false, count: boardSize*boardSize)
        
    }
    
}

extension BGGamePageViewController: GameSettingDelegate{
    func setSize(_ setPage: BGSettingViewController, size: Int) {
        self.boardSize = size
        self.createBoard()
    }
    
    func setGoal(_ setPage: BGSettingViewController, goal: Int) {
        self.goal = goal
    }
    
    func setRange(_ setPage: BGSettingViewController, min: Int, max: Int) {
        self.minNum = min
        self.maxNum = max
    }
    
}

extension BGGamePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boardSize*boardSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BGBoardCell
        if board[indexPath.item] == true {
            cell.m_lbNum.backgroundColor = UIColor.darkGray
        } else {
            cell.m_lbNum.backgroundColor = UIColor.gray
        }
        cell.m_lbNum.text = "\(indexPath.item + 1)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let iBoardSize = (self.m_cvBoard!.frame.width / CGFloat(boardSize))
        return CGSize(width: iBoardSize, height: iBoardSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        board[indexPath.item] = !board[indexPath.item]
        self.m_cvBoard?.reloadData()
    }
}
