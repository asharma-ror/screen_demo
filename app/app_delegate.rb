class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    navigationController = UINavigationController.alloc.init
    @objectID = nil
    navigationController.pushViewController(InquiriesController.alloc.init, animated:true)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible
    true
  end
end

