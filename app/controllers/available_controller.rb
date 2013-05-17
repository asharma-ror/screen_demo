class AvailableController < UIViewController


  def viewDidLoad
    super
    self.title = "Inquiry"    

    self.view.backgroundColor = UIColor.whiteColor

    @heading = UILabel.new
    @heading.font = UIFont.systemFontOfSize(18)
    @heading.text = 'Preston French'
    @heading.textAlignment = UITextAlignmentLeft
    @heading.textColor = UIColor.blackColor
    @heading.frame = [[5, 5], [self.view.frame.size.width - 5, 20]]
    self.view.addSubview @heading
 
    @subHeading = UILabel.new
    @subHeading.font = UIFont.systemFontOfSize(14)
    @subHeading.text = 'Guest Name'
    @subHeading.textAlignment = UITextAlignmentLeft
    @subHeading.textColor = UIColor.blackColor
    @subHeading.frame = [[5, 25], [self.view.frame.size.width - 5, 20]]
    self.view.addSubview @subHeading



    @table = UITableView.alloc.init
    @table.frame = [[0, 50], [self.view.frame.size.width, self.view.frame.size.height - 150 ]]
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self
    # Just for demo purpose. will chnage it to hash format
    @data = [["Check In","Jul 9, 2013"],["Check In","Aug 10, 2013"],["# Nights","30"],["Guest","2 Adults 0 Children"],["Email","Preston@example.com"],["Phone","808-867-5309"],["Comments","Honeymoon"]]

    @editButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @editButton.setTitle("Edit", forState:UIControlStateNormal)
    @editButton.sizeToFit
    @editButton.center = CGPointMake((self.view.frame.size.width) / 2, (self.view.frame.size.height) - 75)
    @editButton.addTarget(self, action:'edit', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview @editButton
  end


  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      cell = CustomCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton if [0,1].include? indexPath.row
      cell.createLabels
      cell
    end
    cell.primaryLabel.text = @data[indexPath.row][0]
    cell.secondaryLabel.text = @data[indexPath.row][1]
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
    @data.count
  end


  def edit
    availableEditController = AvailableEditController.alloc.init
    self.navigationController.pushViewController(availableEditController, animated: true)
  end
end