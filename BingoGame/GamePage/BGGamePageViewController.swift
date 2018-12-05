//
//  BGGamePageViewController.swift
//  BingoGame
//
//  Created by Patato on 2018/12/4.
//  Copyright © 2018 Patato. All rights reserved.
//

import Foundation
import UIKit

enum BoardStatus {
    case Default
    case Ready
    case Gaming
}

class BGGamePageViewController: UIViewController {
    
    // UI
    var m_btnSetting: UIBarButtonItem?
    var m_lbStatus: UILabel?
    var m_cvBoard: UICollectionView?
    var m_btnGameStart: UIButton?
    
    
    // variable
    var m_iBoardSize:Int = 0
    var m_iGoal:Int = 0
    var m_iMinNum:Int = 0
    var m_iMaxNum:Int = 0
    var m_aryGameBoard = [Bool]()
    var m_iChessNum:Int = 0
    var m_bBoardInput: Bool = false
    var m_BoardStatus: BoardStatus = .Default
    var m_aryBoardNum = [Int]()
    
    
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
        startBtnSet()
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
    
    private func startBtnSet() {
        m_btnGameStart = UIButton(frame: CGRect(x: 90, y: 580, width: 200, height: 40))
        m_btnGameStart!.layer.cornerRadius = 10
        switch m_BoardStatus {
        case .Ready:
            m_btnGameStart!.setTitle("Game Start", for: .normal)
            m_btnGameStart!.backgroundColor = UIColor.init(red: 127 / 255, green: 176 / 255, blue: 105 / 255, alpha: 1)
            self.view.addSubview(m_btnGameStart!)
        case .Gaming:
            m_btnGameStart!.setTitle("End Game", for: .normal)
            m_btnGameStart!.backgroundColor = UIColor.init(red: 202 / 255, green: 60 / 255, blue: 37 / 255, alpha: 1)
        default:
            break
        }
        
    }
    
    
    // Function
    @objc private func clickSetting() {
        let m_vcSetPage = BGSettingViewController()
        m_vcSetPage.setDelegate = self
        self.navigationController?.pushViewController(m_vcSetPage, animated: true)
    }
    
    private func createBoard() {
        self.m_aryGameBoard.removeAll()
        self.m_aryGameBoard = [Bool](repeating: false, count: m_iChessNum)
        randonBoard()
        let layout = UICollectionViewFlowLayout()
        m_cvBoard = UICollectionView(frame: CGRect(x: 5, y: 180, width: self.view.frame.width - 10, height: self.view.frame.width - 10), collectionViewLayout: layout)
        m_cvBoard?.register(BGBoardCell.self, forCellWithReuseIdentifier: "Cell")
        m_cvBoard!.backgroundColor = UIColor.gray
        self.view.addSubview(m_cvBoard!)
        self.m_cvBoard?.delegate = self
        self.m_cvBoard?.dataSource = self
        self.m_BoardStatus = .Ready
        self.startBtnSet()
        
    }
    
    private func randonBoard() {
        m_aryBoardNum = [Int](repeating: -1, count: m_iChessNum)
        for i in 0..<m_iChessNum {
            var bValidNum = true
            repeat{
                m_aryBoardNum[i] = Int.random(in: m_iMinNum...m_iMaxNum)
                bValidNum = true
                for j in 0..<i {
                    if m_aryBoardNum[i] == m_aryBoardNum[j]{
                        bValidNum = false
                    }
                }
            }while bValidNum == false
        }
    }
    
    private func checkBingoLine() -> Int {
        var iLine: Int = 0
        //check raw
        for i in stride(from: 0, to: m_iChessNum, by: m_iBoardSize) {
            var goalNum = 0
            for j in 0..<m_iBoardSize {
                if m_aryGameBoard[i + j] == true {
                    goalNum = goalNum + 1
                }else {
                    break
                }
            }
            if goalNum == m_iBoardSize {
                iLine = iLine + 1
            }
        }
        
        //check column
        for i in 0..<m_iBoardSize {
            var goalNum = 0
            for j in stride(from: 0, to: m_iChessNum, by: m_iBoardSize){
                if m_aryGameBoard[i + j] == true {
                    goalNum = goalNum + 1
                }else {
                    break
                }
            }
            if goalNum == m_iBoardSize {
                iLine = iLine + 1
            }
        }
        
        //check diagonal
        var iGoalNum: Int = 0
        for i in stride(from: 0, to: m_iChessNum, by: m_iBoardSize + 1){
            if m_aryGameBoard[i] == true {
                iGoalNum = iGoalNum + 1
            }else {
                break
            }
        }
        if iGoalNum == m_iBoardSize {
            iLine = iLine + 1
        }
        
        //check another diagonal
        iGoalNum = 0
        for i in stride(from: m_iBoardSize - 1, to: m_iChessNum - m_iBoardSize + 1, by: m_iBoardSize - 1){
            if m_aryGameBoard[i] == true{
                iGoalNum = iGoalNum + 1
            }else {
                break
            }
        }
        if iGoalNum == m_iBoardSize {
            iLine = iLine + 1
        }
        
        
        return iLine
    }
    
}

extension BGGamePageViewController: GameSettingDelegate{
    func setSize(_ setPage: BGSettingViewController, size: Int?) {
        guard let iInputSize = size else {
            return
        }
        self.m_iBoardSize = iInputSize
        self.m_iChessNum = iInputSize * iInputSize
        self.createBoard()
    }
    
    func setGoal(_ setPage: BGSettingViewController, goal: Int?) {
        guard let iInputGoal = goal else {
            return
        }
        self.m_iGoal = iInputGoal
        self.m_lbStatus?.text = "Bingo 0 lines. Goal: \(iInputGoal) lines"
    }
    
    func setRange(_ setPage: BGSettingViewController, min: Int?, max: Int?) {
        guard let iInputMin = min else {
            return
        }
        guard let iInputMax = max else {
            return
        }
        self.m_iMinNum = iInputMin
        self.m_iMaxNum = iInputMax
    }
    
}

extension BGGamePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return m_iChessNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BGBoardCell
        if m_aryGameBoard[indexPath.item] == true {
            cell.m_txfNum.backgroundColor = UIColor.darkGray
        } else {
            cell.m_txfNum.backgroundColor = UIColor.gray
        }
        cell.m_txfNum.text = "\(m_aryBoardNum[indexPath.item])"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let iBoardSize = (self.m_cvBoard!.frame.width / CGFloat(m_iBoardSize))
        return CGSize(width: iBoardSize, height: iBoardSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        m_aryGameBoard[indexPath.item] = !m_aryGameBoard[indexPath.item]
        self.m_cvBoard?.reloadData()
        m_lbStatus?.text = "Bingo \(checkBingoLine()) lines. Goal: \(m_iGoal) lines"
    }
}
