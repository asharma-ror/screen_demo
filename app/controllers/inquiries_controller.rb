class InquiriesController < UIViewController

  def self.controller
    @controller ||= InquiriesController.alloc.initWithNibName(nil, bundle:nil)
  end

  def viewDidLoad
    super
    self.title = "Inquiries"

    rightButton = UIBarButtonItem.alloc.initWithTitle("New Inquiry", style: UIBarButtonItemStyleBordered, target:self, action:'add')
    self.navigationItem.rightBarButtonItem = rightButton

    leftButton = UIBarButtonItem.alloc.initWithTitle("Dashboard", style: UIBarButtonItemStyleBordered, target:self, action:'deshboard')
    self.navigationItem.leftBarButtonItem = leftButton

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @data = InquiryStore.shared.inquiries
    @table.dataSource = self
    @table.delegate = self
  end

  def add    
    availableEditController = AvailableNewController.alloc.init
    self.navigationController.pushViewController(availableEditController, animated: true)
  end

  def deshboard
    self.navigationController.setViewControllers([DashboardController.alloc.init], animated: true)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      #cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator 
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end
    cell.textLabel.text = @data[indexPath.row].guest_name
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
   # just for learning purpose when row tapped
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row].guest_name} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    UIApplication.sharedApplication.delegate.instance_variable_set('@objectID',@data[indexPath.row].objectID)
    self.navigationController.pushViewController(AvailableController.alloc.init, animated: true)
  end
end