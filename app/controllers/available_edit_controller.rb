class AvailableEditController < Formotion::FormController

  def init
    @inquiry_id = UIApplication.sharedApplication.delegate.instance_variable_get('@objectID')
    @data = InquiryStore.shared.findInquiriyWithID(@inquiry_id)

    form = Formotion::Form.new({
      title: "Kitchen Sink",
      sections: [{
        rows: [{
          title: "Guest Name",
          value: @data.guest_name,
          key: :guest_name,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Check In",
          value: @data.check_in_date.to_i,
          key: :check_in_date,
          type: :date,
          format: :medium
        }, {
          title: "Check Out",
          value: @data.check_out_date.to_i,
          key: :check_out_date,
          type: :date,
          format: :medium
        }, {
          title: "# Nights",
          value: @data.nights.to_i,
          key: :nights,
          placeholder: "",
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Guest",
          value: @data.guest,
          key: :guest,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Email",
          value: @data.email,
          key: :email,
          placeholder: "",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Phone",
          value: @data.phone,
          key: :phone,
          placeholder: "",
          type: :phone,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
            title: "Comments",
            value: @data.comment,
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
    InquiryStore.shared.updateInquiry(@inquiry_id, { guest_name: form.render[:guest_name],
                                                     check_in_date: Time.at(form.render[:check_in_date]),
                                                     check_out_date: Time.at(form.render[:check_out_date]), 
                                                     nights: form.render[:nights].to_i, 
                                                     guest: form.render[:guest], 
                                                     email: form.render[:email], 
                                                     phone: form.render[:phone], 
                                                     comment: form.render[:comment]
                                                    })
    

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