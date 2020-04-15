 class Cli
    puts "Welcome to Vehicle Fleet Maintenance Manager"
    prompt = TTY::Prompt.new
    prompt.select("Please make a selection:", %w(Log_In, Create_Account))
end

#     def welcome_menu
#         puts "Welcome to Vehicle Fleet Maintenance Manager"
#         puts "enter username:"
#         user_name = gets.chomp
#         if user_name == already exists
#             load_profile
#         else
#             create_profile
#         end
#     end

#     def load_profile
#         puts #{company_name} not locally defined
#         puts #{fleet} not locally defined

#         puts "'u' to Update Vehicle Info"
#         puts "'!' to EXIT"
#         if choice == 'u'
#             build_fleet
#         elsif choice == '!'
#             exit!
#         end
#     end

#     def create_profile
#         puts "Please enter company name:"
#         company_name = gets.chomp
#         build_fleet
#     end

#     def build_fleet
#         puts "Please enter your fleet info below"
#         fleet = []
#         vehicle = # nick_name = gets.chomp, year = gets.chomp, make = gets.chomp, model = gets.chomp, mileage = gets.chomp
#         fleet << vehicle
#         add_another_van
#     end

#     def add_another_van
#         puts "Would you like to add another vehicle to your fleet? Y or N"
#         if choice == "y"
#             build_fleet
#         else choice == "n"
#             load_profile
#         end
#     end
# end