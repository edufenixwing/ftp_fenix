require 'io/console'
require 'net/ftp'

puts "######################### FENIX WING FTP CLIENT ###################################"
puts "###################################################################################"
puts "######################## DEVELOPED BY EDUARDO MARQUES #############################"
puts "############################# www.fenixwing.com.br#################################"
puts "######################## consultoria@fenixwing.com.br #############################"
print "\n\n"


print "Enter the server address (IP)> "
@server = gets.chop
print "Enter the username> "
@user = gets.chop
print "Enter the password> "
@password = STDIN.noecho(&:gets).chop
puts "Trying to connect to the server..."

begin
  client = Net::FTP.new(@server, :username => @user, :password => @password)
  puts "Successfully...Connection established!!!"
  puts "Select an option:"
  print "\n"
  puts "1. List the current directory"
  puts "2. Change the directory"
  puts "3. Upload a file"
  puts "4. Download a file"
  puts "5. Exit"
  print "\n"
  print "answer> "

  while command = gets.chomp
    case command.to_i

    when 1
      puts client.list
      print "answer> "

    when 2
      print "To which directory? > "
      directory = gets.chop
      client.chdir directory
      puts "Directory changed to: " << client.pwd
      print "answer> "

    when 3
      print "File to upload> "
      upload = gets.chop
      puts "Uploading file..."
      client.put upload
      puts "Ok!"
      print "answer> "


    when 4
      print "File to download> "
      download = gets.chop
      puts "Downloading file..."
      client.get download
      print "answer> "

    when 5
      client.close
      exit
    end
  end

  end
