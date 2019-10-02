
class Lsrepo::CLI

  def run
    puts '==== HI THERE ===='
    puts
    puts 'Please enter a github username:'
    username = gets.chomp

    puts "You entered \"#{username}\""

    scrapper = Lsrepo::Scrapper.new(username)
    puts "--- here are the repos ---"
    scrapper.repos.each_with_index do |repo, idx|
      puts "#{idx + 1}: #{repo}"
    end
  end

end
