# Preview all emails at http://localhost:3000/rails/mailers/transfer_mailer
class TransferMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transfer_mailer/create_transfer
  def create_transfer
    TransferMailer.create_transfer
  end

end
