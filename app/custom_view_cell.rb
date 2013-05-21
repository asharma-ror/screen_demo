class CustomViewCell < UITableViewCell
 
  #attr_accessor :primaryLabel
  #attr_accessor :secondaryLabel
  attr_accessor :customView

  def applyCustomView1(cellData)
    
    self.instance_variable_set('@primaryLabel',UILabel.alloc.init)
    self.instance_variable_set('@secondaryLabel',UILabel.alloc.init)

    @customView = "applyCustomView1"

    @primaryLabel.textAlignment = UITextAlignmentLeft
    @primaryLabel.font = UIFont.systemFontOfSize(18)
    
    
    @secondaryLabel.textAlignment = UITextAlignmentLeft
    @secondaryLabel.font = UIFont.systemFontOfSize(12)
    @secondaryLabel.lineBreakMode = UILineBreakModeWordWrap
    @secondaryLabel.numberOfLines = 0
    
    if cellData.is_a? Array
      @primaryLabel.text = cellData[0]
      @secondaryLabel.text = cellData[1]
    else
      @primaryLabel.text = cellData
    end 
    self.contentView.addSubview(@primaryLabel)
    self.contentView.addSubview(@secondaryLabel)

    self
  end 

  def applyCustomView2(cellData)
    
    self.instance_variable_set('@primaryLabel',UILabel.alloc.init)
    self.instance_variable_set('@secondaryLabel',UILabel.alloc.init)
    
    self.instance_variable_set('@statusLabel1',UILabel.alloc.init)
    self.instance_variable_set('@statusLabel2',UILabel.alloc.init)

    @customView = "applyCustomView2"

    @primaryLabel.textAlignment = UITextAlignmentLeft
    @primaryLabel.font = UIFont.systemFontOfSize(18)
    
    
    @secondaryLabel.textAlignment = UITextAlignmentLeft
    @secondaryLabel.font = UIFont.systemFontOfSize(12)
    @secondaryLabel.lineBreakMode = UILineBreakModeWordWrap
    @secondaryLabel.numberOfLines = 0


    @statusLabel1.textAlignment = UITextAlignmentLeft
    @statusLabel1.font = UIFont.systemFontOfSize(12)
    @statusLabel1.textColor = UIColor.redColor

    @statusLabel2.textAlignment = UITextAlignmentLeft
    @statusLabel2.font = UIFont.systemFontOfSize(12)
    @statusLabel2.textColor = UIColor.greenColor

    if cellData.is_a? Array
      @primaryLabel.text = cellData[0]
      @secondaryLabel.text = cellData[1]
      @statusLabel1.text = cellData[2] unless cellData[2].nil?
      @statusLabel2.text = cellData[3] unless cellData[3].nil? 
    else
      @primaryLabel.text = cellData
    end 
    self.contentView.addSubview(@primaryLabel)
    self.contentView.addSubview(@secondaryLabel)
    self.contentView.addSubview(@statusLabel1)
    self.contentView.addSubview(@statusLabel2)
    self
  end 

  def layoutSubview1(origin,size)
    @primaryLabel.frame = CGRectMake(origin.x + 5, 5, size.width - 80, 25)
    @secondaryLabel.frame = CGRectMake(origin.x + 5, 30, size.width - 80 , 35)
  end

  def layoutSubview2(origin,size)
    @primaryLabel.frame = CGRectMake(origin.x + 5, 5, size.width - 80, 25)
    @secondaryLabel.frame = CGRectMake(origin.x + 5, 30, size.width - 80 , 35)

    @statusLabel1.frame = CGRectMake(size.width - 70, 30, 50 , 15)
    @statusLabel2.frame = CGRectMake(size.width - 70, 45, 50 , 15)
  end

  def layoutSubviews
    super
    contentRect = self.contentView.bounds
    layoutSubview1(contentRect.origin,contentRect.size)  if @customView == "applyCustomView1"
    layoutSubview2(contentRect.origin,contentRect.size)  if @customView == "applyCustomView2"    
  end
 
end