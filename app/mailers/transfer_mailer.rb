class TransferMailer < ApplicationMailer
  def create_transfer(transfer, current_user)
    @transfer = transfer
    @user = current_user

    mail to: ENV['ACTION_MAILER_SEND_TO'], subject: @transfer.site.name + " borrowed " + @transfer.quantity + " x " + @transfer.stock.name + " from " + @user.name
  end

  def renew_transfer(transfer, current_user)
    @transfer = transfer
    @user = current_user

    mail to: ENV['ACTION_MAILER_SEND_TO'], subject: "A stock borrowed by " + @transfer.site.name + " has been renewed for 7 days from " + @user.name
  end


  def return_transfer(transfer, current_user)
    @transfer = transfer
    @user = current_user

    mail to: ENV['ACTION_MAILER_SEND_TO'], subject: @transfer.quantity + " stock(s) borrowed by " + @transfer.site.name + " have been marked as returned from " + @user.name
  end


  def cancel_transfer(transfer, current_user)
    @transfer = transfer
    @user = current_user

    mail to: ENV['ACTION_MAILER_SEND_TO'], subject: "A transfer regarding " + @transfer.quantity + " stock(s) borrowed by " + @transfer.site.name + " has been canceled from " + @user.name
  end

end
