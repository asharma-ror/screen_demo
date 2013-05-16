class QuoteController < UIViewController

  def self.controller
    @controller ||= QuoteController.alloc.initWithNibName(nil, bundle:nil)
  end

  def viewDidLoad
    super
    self.title = "Quote"
  end

end