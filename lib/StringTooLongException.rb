
class StringTooLongException < StandardError
  attr :ok_to_retry
  def intialize(ok_to_retry)
    @ok_to_retry = ok_to_retry
  end
end