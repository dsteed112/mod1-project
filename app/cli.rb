class Cli
    
    def welcome_menu
        puts "Welcome to Vehicle Fleet Maintenance Manager"
            prompt = TTY::Prompt.new
            welcome = prompt.select("Please make a selection:", %w(Log_In Create_Account))
        if welcome == "Log_In"
            puts "Enter username:"
            user_name = gets.chomp
            #load profile  
        else welcome == "Create_Account"
            create_profile
        end
    end

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

    def create_profile
        prompt = TTY::Prompt.new
        result = prompt.collect do
            key(:user_name).ask('User Name?')
          
            key(:company_name).ask('Company Name?')

        
        
        end
        latest_company = Company.create(
            user_name: result[:user_name],
            company_name: result[:company_name]
        )
        build_fleet (latest_company)
    end

    def build_fleet (company)
        puts "Please enter your fleet info below"
        prompt = TTY::Prompt.new
        response = prompt.select("Please make a selection:", %w(Add_van_to_fleet Finished))
        if response == "Add_van_to_fleet"
            create_van (company)
            build_fleet (company)
        else response == "Finished"
            puts "Thanks for building your fleet!"
        end
        
    end

    def create_van (company)
        prompt = TTY::Prompt.new
        result = prompt.collect do
            key(:nick_name).ask('Van Name?')
            key(:year).ask('Year?')
            key(:make).ask('Make?')
            key(:model).ask('Model?')
            key(:mileage).ask('Mileage?')
        end
        
        latest_van = Van.create(
            nick_name: result[:nick_name],
            year: result[:year],
            make: result[:make],
            model: result[:model],
            mileage: result[:mileage],
            company_id: company.id
        )


    end

end
