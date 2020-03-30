//
//  ReportDetailsViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import Auk

class ReportDetailsViewController: BaseReportDetailsViewController {
    
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var reportDetailsView: ReportDetailsView?
    
    @IBOutlet weak var tableView: UITableView!
    
//    MARK: For test. Not sure if there is a data source for progress information. Check when server is available
    var dataSource: ProgressDataSource?
    
    var manager = ReportsManager()
    var report: Report?
    var user: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapViewWithCluster()
        showReportDetails()
        setupDataSourceForProgressTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if report == nil {
            print("TODO: error")
            self.navigationController?.popViewController(animated: true)
            return
        }
    }
    
    func setupMapViewWithCluster() {
        
// Note that application must retain strong references to both
        // cluster listener and cluster tap listener
        let collection = mapView.mapWindow.map.mapObjects.addClusterizedPlacemarkCollection(with: self)
        
        // Load data
//        displayLoading(loading: true)
        manager.getReportsList { (reports, error) in
//            self.displayLoading(loading: false)
            
            if error != nil {
                print("error")
                return
            }
            
            let points = self.generatePoints(reports!)
            collection.clear()
            collection.addPlacemarks(with: points, image: UIImage.markerImage(), style: YMKIconStyle())
            collection.clusterPlacemarks(withClusterRadius: 60, minZoom: 15)
        }
    }
    
    func showReportDetails() {
        
        reportDetailsView?.scrollView.delegate = self
        
        setupImageViewer()
        
        reportDetailsView?.categoryIcon.image = report?.categoryIcon
        reportDetailsView?.categoryName.text = report?.categoryName
        reportDetailsView?.subCategoryName.text = report?.subcategoryName
        reportDetailsView?.address.text = report?.address
        reportDetailsView?.indicatedPeriod.text = ""
        reportDetailsView?.reportCreatedDate.text = report?.created?.string(format: "yyyy.MM.dd")
        reportDetailsView?.numberOfReport.text = ""
        reportDetailsView?.autor.text = user?.id == report?.userID ? user?.name : ""
        reportDetailsView?.reportDescription.text = report?.description
        reportDetailsView?.status.text = report?.status
        
        getReportStatus(status: report?.status)
        
    }
    
    func getReportStatus(status: String?) {
        switch status {
        case "taskModeration":
            reportDetailsView?.status.text = "На модерации"
            reportDetailsView?.status.textColor = .orange
        case "taskAcceptance":
            reportDetailsView?.status.text = "Принято в обработку"
            reportDetailsView?.status.textColor = UIColor(named: "App Blue")
        case "taskEnterResult":
            reportDetailsView?.status.text = ""
            reportDetailsView?.status.textColor = .black
        case "taskPerformanceEvaluation":
            reportDetailsView?.status.text = ""
            reportDetailsView?.status.textColor = .black
        case "taskRejected":
            reportDetailsView?.status.text = "Отклонено"
            reportDetailsView?.status.textColor = .orange
        case "taskClosed":
            reportDetailsView?.status.text = "Работа выполнена"
            reportDetailsView?.status.textColor = .green
        case "taskAll":
            print("taskAll - Not defined type!")
        default:
            break
        }
    }
    
    func setupDataSourceForProgressTableView() {
        dataSource = ProgressDataSource(tableView: self.tableView)
//        dataSource?.onLoading = { (isLoading) in
//            self.displayLoading(loading: isLoading)
//        }
        dataSource?.reload()
    }
}
