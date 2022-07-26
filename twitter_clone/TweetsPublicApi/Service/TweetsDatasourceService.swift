//
//  TweetsDatasourceService.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 25/07/2022.
//

import Foundation

protocol TweetsDatasourceService{
    func fetchDatasource(completion: @escaping ([TweetsDatasource]) -> Void) -> Void
}
