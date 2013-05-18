class AvailableEditController < Formotion::FormController

  def init
    delegate = UIApplication.sharedApplication.delegate
    inquiries_array = delegate.instance_variable_get('@inquiries_array')
    inquiries_index = delegate.instance_variable_get('@inquiries_index')

    @data = inquiries_array[inquiries_index] #{ guest_name: "Preston French", check_in_date: "326937600" , check_out_date: "326937600" , nights: "30" , adults: "2" , children: "0" , email: "Preston@example.com", phone: "808-867-5309", comment: "Honeymoon"}
    form = Formotion::Form.new({
      title: "Kitchen Sink",
      sections: [{
        rows: [{
          title: "Guest Name",
          value: @data[:guest_name],
          key: :guest_name,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Check In",
          value: @data[:check_in_date].to_i,
          key: :check_in_date,
          type: :date,
          format: :medium
        }, {
          title: "Check Out",
          value: @data[:check_out_date].to_i,
          key: :check_out_date,
          type: :date,
          format: :medium
        }, {
          title: "# Nights",
          value: @data[:nights],
          key: :nights,
          placeholder: "",
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Guest",
          value: @data[:guest],
          key: :guest,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Email",
          value: @data[:email],
          key: :email,
          placeholder: "",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Phone",
          value: @data[:phone],
          key: :phone,
          placeholder: "",
          type: :phone,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
            title: "Comments",
            value: @data[:comment],
            key: :comment,
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

    delegate = UIApplication.sharedApplication.delegate
    inquiries_array = delegate.instance_variable_get('@inquiries_array')
    inquiries_index = delegate.instance_variable_get('@inquiries_index')
    inquiries_array[inquiries_index] = form.render
    delegate.instance_variable_set('@inquiries_array',inquiries_array)

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
    self.navigationController.setViewControllers([@inquiriesController], animated:true)
  end
end