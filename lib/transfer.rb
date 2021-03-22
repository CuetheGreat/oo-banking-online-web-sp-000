class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender,receiver, transfer_amount)
    @sender= sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
    puts "amount: #{@amount}, sender: #{@sender.balance}, receiver: #{@receiver.balance} "
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    if valid? && @status != "complete"
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "complete"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
    
end
