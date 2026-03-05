//
//  SceneDelegate.swift
//  Reminder
//
//  Created by Willys Oliveira on 12/06/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var flowController: ReminderFlowCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        flowController = ReminderFlowCoordinator()
        let rootViewController = flowController?.startFlow()
        
        
        // Aqui deve entrar a ViewController que será a primeira tela do app (SplashScreen ou HomeView), por equanto criamos uma ViewController genérica, apenas para ter um inicio
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .red
        
        // Aqui foi criado uma navegação para a tela inicial do app e passamos a ViewController genérica que criamos como raiz. Assim quando abrir o app ele será direcionado a essa ViewController.
//        let navigation = UINavigationController(rootViewController: SplashViewController())
        
        
        // Nesta parte é a configuração final. Onde eu passo para a raiz da minha janela (window) a navigation, que é minha ViewController genérica. Atribuo ela a propriedade da classe com o self.windows e depois torno ela visivel. Isso é uma configuração padrão para um projeto UiKit sem Storyboard.
        
        //MARK: - Toda lógica acima foi inicial e agora foi transferida para o Coordinator que lida com todo o fluxo de navegação do app
        
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

