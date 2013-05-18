class AvailableController < UIViewController


  def viewDidLoad
    super
    self.title = "Inquiry"    

    self.view.backgroundColor = UIColor.whiteColor

    delegate = UIApplication.sharedApplication.delegate
    inquiries_array = delegate.instance_variable_get('@inquiries_array')
    inquiries_index = delegate.instance_variable_get('@inquiries_index')

    @get_data = inquiries_array[inquiries_index]

    @heading = UILabel.new
    @heading.font = UIFont.systemFontOfSize(18)
    @heading.text = @get_data[:guest_name]
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

    @data = [["Check In",Time.at(@get_data[:check_in_date]).strftime("%b %d, %Y")],["Check Out",Time.at(@get_data[:check_out_date]).strftime("%b %d, %Y")],["# Nights",@get_data[:nights]],["Guest",@get_data[:guest]],["Email",@get_data[:email]],["Phone",@get_data[:phone]],["Comments",@get_data[:comment]]]

    @editButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @editButton.setTitle("Edit", forState:UIControlStateNormal)
    @editButton.sizeToFit
    @editButton.center = CGPointMake((self.view.frame.size.width) / 4, (self.view.frame.size.height) - 75)
    @editButton.addTarget(self, action:'edit', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview @editButton

    @deleteButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @deleteButton.setTitle("Delete", forState:UIControlStateNormal)
    @deleteButton.sizeToFit
    @deleteButton.center = CGPointMake(((self.view.frame.size.width) / 4) * 3, (self.view.frame.size.height) - 75)
    @deleteButton.addTarget(self, action:'delete', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview @deleteButton

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

  def delete
    delegate = UIApplication.sharedApplication.delegate
    inquiries_array = delegate.instance_variable_get('@inquiries_array')
    inquiries_index = delegate.instance_variable_get('@inquiries_index')
    inquiries_array.delete_at(inquiries_index)
    delegate.instance_variable_set('@inquiries_array',inquiries_array)
    delegate.instance_variable_set('@inquiries_index',-1)

    @inquiriesController = InquiriesController.alloc.init
    self.navigationController.setViewControllers([@inquiriesController], animated:true)      
  end

end