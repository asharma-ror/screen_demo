class Inquiry < NSManagedObject

  # This is how you set database defaults, weird, I know
  # def awakeFromInsert
  #   super

  #   setValue('', forKey: 'guest_name')
  #   setValue(Time.now, forKey:'check_in_date')
  #   setValue(Time.now, forKey:'check_out_date')
  #   setValue('0', forKey: 'nights')
  #   setValue('0 Adult 0 Childrens', forKey: 'guest')
  #   setValue('', forKey: 'email')
  #   setValue('', forKey: 'phone')
  #   setValue('', forKey: 'comment')
  # end

  # This is the part that will enable our object to interact with the sqlite database
  def self.entity
    @entity ||= begin
      entity = NSEntityDescription.new
      entity.name = 'Inquiry'
      entity.managedObjectClassName = 'Inquiry'
      entity.properties =
        ['guest_name', NSStringAttributeType , 
         'check_in_date', NSDateAttributeType , 
         'check_out_date', NSDateAttributeType ,
         'nights', NSInteger16AttributeType ,
         'guest', NSStringAttributeType ,
         'email', NSStringAttributeType ,
         'phone', NSStringAttributeType ,
         'comment', NSStringAttributeType].each_slice(2).map do |name, type|
            property = NSAttributeDescription.new
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end
      entity
    end
  end

end