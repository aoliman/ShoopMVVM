//
//  LoginFlowCoordinator.swift
//  ShoopMVVM
//
//  Created by SH EG on 09/07/2022.
//

import UIKit
class LoginFlowCoordinator {
    
    private weak var navigationController: UINavigationController?

    private weak var moviesQueriesSuggestionsVC: UIViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow do not need to be strong referenced
//        let actions = MoviesListViewModelActions(showMovieDetails: showMovieDetails,
//                                                 showMovieQueriesSuggestions: showMovieQueriesSuggestions,
//                                                 closeMovieQueriesSuggestions: closeMovieQueriesSuggestions)
//        let vc = dependencies.makeMoviesListViewController(actions: actions)
        
        
        

        navigationController?.pushViewController(LoginSceneDIContainer().LoginViewController(), animated: false)
    }

}
