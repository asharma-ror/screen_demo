class InquiryStore
  # Singleton me baby!
  def self.shared
    @shared ||= InquiryStore.new
  end

  # The list of inquiries
  def inquiries
    @inquiries ||= begin
      # Each sql query starts with an NSFetchRequest, duh! Yeah it wasn't obvious to me either
      request = NSFetchRequest.alloc.init
      # I think you can see how you can generalize this to any object when you write a gem (GO FORTH AND WRITE ONE)
      request.entity = NSEntityDescription.entityForName('Inquiry', inManagedObjectContext:@context)
      request.sortDescriptors = [NSSortDescriptor.alloc.initWithKey('check_in_date', ascending:false)]

      # mmmm pointers
      error_ptr = Pointer.new(:object)
      data = @context.executeFetchRequest(request, error:error_ptr)
      raise "Error when fetching data: #{error_ptr[0].description}" if data == nil # probably should handle this differently
      data
    end
  end

  # CRUD time has begun!
  def addInquiry
    yield NSEntityDescription.insertNewObjectForEntityForName('Inquiry', inManagedObjectContext:@context)
    save
  end

  def findInquiriyWithID(id)
    error_ptr = Pointer.new(:object)
    inquiry = @context.existingObjectWithID(id, error:error_ptr)
  end

  def updateInquiry(id, attributes = {})
    error_ptr = Pointer.new(:object)
    inquiry = @context.existingObjectWithID(id, error:error_ptr)
    attributes.each do |key, value|
      inquiry.send("#{key}=", value) if inquiry.respond_to?(key)
    end
    save
  end

  def removeInquiry(inquiry)
    @context.deleteObject(inquiry)
    save
  end

  private

  def initialize
    model = NSManagedObjectModel.alloc.init
    model.entities = [Inquiry.entity] # this is how you use the self.entity method from earlier

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'Inquiries.sqlite'))
    error_ptr = Pointer.new(:object)
    raise "Can't add persistent SQLite store: #{error_ptr[0].description}" unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)

    context = NSManagedObjectContext.alloc.init
    context.persistentStoreCoordinator = store
    @context = context
  end

  def save
    error_ptr = Pointer.new(:object)
    raise "Error when saving the model: #{error_ptr[0].description}" unless @context.save(error_ptr)
    @inquiries = nil
  end
end