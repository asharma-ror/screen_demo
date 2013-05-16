class InquiriesController < UIViewController

  def viewDidLoad
    super
    self.title = "Inquiries"

    rightButton = UIBarButtonItem.alloc.initWithTitle("Available", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    self.navigationItem.rightBarButtonItem = rightButton
  end

  def push
    availableController = AvailableController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(availableController, animated: true)
  end

end