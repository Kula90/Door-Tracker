# generate_password_digests.rb
require 'bcrypt'

passwords = ['password1', 'password2', 'password3', 'password4', 'password5']

passwords.each_with_index do |password, index|
  puts "User #{index + 1} password digest: #{BCrypt::Password.create(password)}"
end
