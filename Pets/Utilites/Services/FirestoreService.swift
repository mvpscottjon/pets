//
//  FirestoreService.swift
//  Pets
//
//  Created by Seven on 2022/7/23.
//

import FirebaseCore
import FirebaseFirestore

final class FirestoreService {
        
    // MARK: - Properties
    static let shared = FirestoreService()
    
    private let db = Firestore.firestore()
}
