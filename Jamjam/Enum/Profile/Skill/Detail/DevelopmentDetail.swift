//
//  DevelopmentDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum DevelopmentDetail: Int, Codable {
    case react = 46
    case vue = 47
    case angular = 48
    case node = 49
    case python = 50
    case java = 51
    case spring = 52
    case django = 53
    case flask = 54
    case express = 55
    case mysql = 56
    case postgresql = 57
    case mongodb = 58
    case aws = 59
    case docker = 60
    case kubernetes = 61
    case git = 62
    case javascript = 63
    case typescript = 64
    case nextjs = 65
    case nestjs = 66
    case graphql = 67
    case firebase = 68
    case cicd = 69
    case webSecurity = 70
    case mobileAppDevelopment = 71

    var displayName: String {
        switch self {
        case .react: return "React"
        case .vue: return "Vue.js"
        case .angular: return "Angular"
        case .node: return "Node.js"
        case .python: return "Python"
        case .java: return "Java"
        case .spring: return "Spring"
        case .django: return "Django"
        case .flask: return "Flask"
        case .express: return "Express.js"
        case .mysql: return "MySQL"
        case .postgresql: return "PostgreSQL"
        case .mongodb: return "MongoDB"
        case .aws: return "AWS"
        case .docker: return "Docker"
        case .kubernetes: return "Kubernetes"
        case .git: return "Git"
        case .javascript: return "JavaScript"
        case .typescript: return "TypeScript"
        case .nextjs: return "Next.js"
        case .nestjs: return "NestJS"
        case .graphql: return "GraphQL"
        case .firebase: return "Firebase"
        case .cicd: return "CI/CD 구축"
        case .webSecurity: return "웹 보안"
        case .mobileAppDevelopment: return "모바일 앱 개발"
        }
    }
}
