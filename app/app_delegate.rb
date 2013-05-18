class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @navigationController = UINavigationController.alloc.init
    @inquiriesController = InquiriesController.alloc.init
    @inquiries_array = [] # [{:guest_name=>"ritesh", :check_in_date=>1366282670, :check_out_date=>1371553070, :nights=>"38", :guest=>"2 Adult 0 Childs", :email=>"ritesh@ritesh.com", :phone=>"1234567890", :comment=>"Test test"}]
    @inquiries_index = -1
    @navigationController.pushViewController(@inquiriesController, animated:true)
    @window.rootViewController = @navigationController
    @window.makeKeyAndVisible
    true
  end
end
