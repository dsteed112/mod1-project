class Cli
    def welcome_menu
        puts "Welcome to Vehicle Fleet Maintenance Manager"
        puts "enter username:"
        user_name = gets.chomp
        create_profile
    end

    def create_profile
        puts "Please enter company name:"
        company_name = gets.chomp
        build_fleet
    end

    def build_fleet
        puts "Please enter your fleet info below"
        # nick_name = gets
        # year = gets
        # make = gets
        # model = gets
        # mileage = gets
    end
end