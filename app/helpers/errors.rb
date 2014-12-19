def set_error(err_msg)
  session[:error] = err_msg
end

def display_error
  error = session[:error]
  session[:error] = nil
  error
end

def get_ar_errors(ar_obj)
  err_msg = ''
  ar_obj.errors.messages.each do |attr, msgs|
    err_msg += "#{attr}, #{msgs.join(', ')}"
  end
  set_error("Error: #{err_msg}")
end