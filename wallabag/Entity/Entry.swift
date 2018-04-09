//
//  Entry.swift
//  wallabag
//
//  Created by maxime marinel on 27/02/2018.
//  Copyright © 2018 maxime marinel. All rights reserved.
//

import Foundation
import RealmSwift
import WallabagKit

final class Entry: Object {
    @objc dynamic public var content: String?
    @objc dynamic public var createdAt: Date?
    @objc dynamic public var domainName: String?
    @objc dynamic public var id: Int = 0
    @objc dynamic public var isArchived: Bool = false
    @objc dynamic public var isStarred: Bool = false
    @objc dynamic public var previewPicture: String?
    @objc dynamic public var title: String?
    @objc dynamic public var updatedAt: Date?
    @objc dynamic public var url: String?
    @objc dynamic public var readingTime: Int = 0
    @objc dynamic public var screenPosition: Float = 0.0

    override class func primaryKey() -> String? {
        return "id"
    }

    override class func indexedProperties() -> [String] {
        return ["title", "content", "isArchived", "isStarred"]
    }

    func hydrate(from article: WallabagEntry) {
        if 0 == id {
            setValue(article.id, forKey: "id")
        }
        setValue(article.title, forKey: "title")
        setValue(article.content, forKey: "content")
        setValue(article.createdAt, forKey: "createdAt")
        setValue(article.updatedAt, forKey: "updatedAt")
        setValue(article.isStarred, forKey: "isStarred")
        setValue(article.isArchived, forKey: "isArchived")
        setValue(article.previewPicture, forKey: "previewPicture")
        setValue(article.domainName, forKey: "domainName")
        setValue(article.readingTime, forKey: "readingTime")
        setValue(article.url, forKey: "url")
    }

    func hydrate(from article: WallabagKitEntry) {
        if 0 == id {
            setValue(article.id, forKey: "id")
        }
        title = article.title
        content = article.content
        createdAt = Date()
        updatedAt = Date()
        domainName = article.domainName
        isArchived = article.isArchived == 1
        isStarred = article.isStarred == 1
        previewPicture = article.previewPicture
        url = article.url
        readingTime = article.readingTime ?? 0
    }
}
