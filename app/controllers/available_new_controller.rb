class AvailableNewController < Formotion::FormController

  def init
    form = Formotion::Form.new({
      title: "Kitchen Sink",
      sections: [{
        rows: [{
          title: "",
          value: "",
          key: :guest_name,
          placeholder: "Guest Name",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "",
          value: nil,
          key: :check_in_date,
          placeholder: "Check In",
          type: :date,
          format: :medium
        }, {
          title: "",
          value: nil,
          key: :check_out_date,
          placeholder: "Check Out",
          type: :date,
          format: :medium
        }, {
          title: "",
          value: "",
          key: :nights,
          placeholder: "# Nights",
          type: :number,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "",
          value: "",
          key: :guest,
          placeholder: "Guest",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "",
          value: "",
          key: :email,
          placeholder: "Email",
          type: :email,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
          title: "",
          value: "",
          key: :phone,
          placeholder: "Phone",
          type: :phone,
          auto_correction: :no,
          auto_capitalization: :none
        }, {
            title: "Comments",
            value: "",
            key: :comment,
            placeholder: "Comments",
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
    InquiryStore.shared.addInquiry do |inquiry|
        inquiry.guest_name = form.render[:guest_name]
        inquiry.check_in_date = Time.at(form.render[:check_in_date])
        inquiry.check_out_date = Time.at(form.render[:check_out_date])
        inquiry.nights = form.render[:nights].to_i
        inquiry.guest = form.render[:guest]
        inquiry.email = form.render[:email]
        inquiry.phone = form.render[:phone]
        inquiry.comment = form.render[:comment]
    end

    @inquiriesController = InquiriesController.alloc.init
    self.navigationController.setViewControllers([@inquiriesController], animated:true)
  end

  def viewDidLoad
    super
    self.title = "New Inquiry"
  end

end