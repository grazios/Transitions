class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    true

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible



    root = AppRootController.alloc.initWithNibName(nil, bundle: nil)
    #naviの設定
    nav = UINavigationController.alloc.initWithRootViewController(root)

    kafka = KafkaController.alloc.initWithNibName(nil, bundle: nil)

    kafka_nav = UINavigationController.alloc.initWithRootViewController(kafka)

    #tab
    tab = UITabBarController.alloc.initWithNibName(nil,bundle: nil)
    tab.viewControllers = [nav,kafka_nav]

    @window.rootViewController = tab
    true

  end
end
