class AvailableEditController < Formotion::FormController

  def init
    form = Formotion::Form.new({
      title: "Kitchen Sink",
      sections: [{
        rows: [{
          title: "Preston French",
          subtitle: "Guest Name",
          type: :static
        }, {
          title: "Check In",
          value: 326937600,
          key: :check_in_date1,
          type: :date,
          format: :medium
        }, {
          title: "Check In",
          value: 326937600,
          key: :check_in_date2,
          type: :date,
          format: :medium
        }, {
          title: "# Nights",
          value: "30",
          key: :number,
          placeholder: "",
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Guest",
          value: "2 Adults 0 Children",
          key: :number,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Email",
          value: "Preston@example.com",
          key: :email,
          placeholder: "",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Phone",
          value: "808-867-5309",
          key: :phone,
          placeholder: "",
          type: :phone,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
            title: "Comments",
            value: "Honeymoon",
            key: :text,
            type: :text,
            placeholder: "",
            row_height: 100
        }]
      }, {
        rows: [{
          title: "Edit",
          type: :submit,
        }]
      }]
    })
    form.on_submit do
      self.edit
    end
    super.initWithForm(form)

  end

  def edit
    @inquiriesController = InquiriesController.alloc.init
    self.navigationController.setViewControllers([@inquiriesController], animated:true)    
  end

  def viewDidLoad
    super
    self.title = "Edit"

    rightButton = UIBarButtonItem.alloc.initWithTitle("Inquiries", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    self.navigationItem.rightBarButtonItem = rightButton    
  end

  def push
    @inquiriesController = InquiriesController.alloc.init
    self.navigationController.setViewControllers([@inquiriesController], animated:false)
  end

end