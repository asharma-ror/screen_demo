class DashboardController < UIViewController


  def viewDidLoad
    super
    self.title = "Dashboard"    

    rightButton = UIBarButtonItem.alloc.initWithTitle("Inquiries", style: UIBarButtonItemStyleBordered, target:self, action:'inquiries')
    self.navigationItem.rightBarButtonItem = rightButton

    @table = UITableView.alloc.initWithFrame(self.view.bounds,style:UITableViewStyleGrouped)
    self.view.addSubview @table

    @table.dataSource = self
    @table.delegate = self
    @data = [["Property Calander"],[["Reservations","T. Enyedi (3/1/2013 - 3/15/2013) \nD. French (3/15/2013 - 3/30/2013)"],["Tasks (4)","Send Contract (T. Jones) \nClean (3/1/2013)"],["Inquiries (10)","A. Novomeszky 3/40/2013 - 4/10/13 \nP. French 6/30/2013 - 7/13/13","Booked","Avaliable"]],["Panding Quates (10)","Iniuiry History"]]
  end

  def inquiries
    self.navigationController.setViewControllers([InquiriesController.alloc.init], animated: true)
  end

  def numberOfSectionsInTableView(tableView)
    3
  end
  
  def tableView(tableView, titleForHeaderInSection:section)
    "Activities" if section == 1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    # return the number of rows
    @data[section].count
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    case indexPath.section
    when 0
      45
    when 1
      70
    else
      30
    end
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      if indexPath.section == 1
        cell = CustomViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
        if indexPath.row == 2
          cell.applyCustomView2(@data[indexPath.section][indexPath.row])
        else
          cell.applyCustomView1(@data[indexPath.section][indexPath.row])
        end
      else
        cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
      end
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
      cell
    end
    cell.textLabel.text = @data[indexPath.section][indexPath.row] unless cell.is_a? CustomViewCell
    cell
  end


end