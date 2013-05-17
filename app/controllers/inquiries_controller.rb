class InquiriesController < UIViewController

  def self.controller
    @controller ||= InquiriesController.alloc.initWithNibName(nil, bundle:nil)
  end

  def viewDidLoad
    super
    self.title = "Inquiries"

    rightButton = UIBarButtonItem.alloc.initWithTitle("New Inquiry", style: UIBarButtonItemStyleBordered, target:self, action:'add')
    self.navigationItem.rightBarButtonItem = rightButton

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table

    @data = ["1","2","3","4","5"]
    @table.dataSource = self
    @table.delegate = self

  end

  def add    
    availableEditController = AvailableNewController.alloc.init
    self.navigationController.pushViewController(availableEditController, animated: true)
  end


  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end

    cell.textLabel.text = @data[indexPath.row]

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    #tableView.deselectRowAtIndexPath(indexPath, animated: true)
    availableController = AvailableController.alloc.init
    self.navigationController.pushViewController(availableController, animated: true)

    #alert = UIAlertView.alloc.init
    #alert.message = "#{@data[indexPath.row]} tapped!"
    #alert.addButtonWithTitle "OK"
    #alert.show
  end

end