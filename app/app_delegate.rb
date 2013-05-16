class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @navigationController = UINavigationController.alloc.init
    @inquiriesController = InquiriesController.alloc.init

    @navigationController.pushViewController(@inquiriesController, animated:true)
    @window.rootViewController = @navigationController

    @window.makeKeyAndVisible

    true
  end
end
