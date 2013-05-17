class AvailableNewController < Formotion::FormController

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
          value: nil,
          key: :check_in_date1,
          type: :date,
          format: :medium
        }, {
          title: "Check In",
          value: nil,
          key: :check_in_date2,
          type: :date,
          format: :medium
        }, {
          title: "# Nights",
          value: "",
          key: :number,
          placeholder: "",
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Guest",
          value: "",
          key: :number,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Email",
          value: "",
          key: :email,
          placeholder: "",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "Phone",
          value: "",
          key: :phone,
          placeholder: "",
          type: :phone,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
            title: "Comments",
            value: "",
            key: :text,
            type: :text,
            placeholder: "",
            row_height: 100
        }]
      }, {
        rows: [{
          title: "Submit",
          type: :submit,
        }]
      }]
    })
    form.on_submit do
      self.submit
    end
    super.initWithForm(form)

  end

  def submit
    @inquiriesController = InquiriesController.alloc.init
    self.navigationController.setViewControllers([@inquiriesController], animated:true)
  end

  def viewDidLoad
    super
    self.title = "New Inquiry"
  end

end