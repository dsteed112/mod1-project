class Cli

    attr_reader :company, :service
    $prompt = TTY::Prompt.new(symbols:{marker: '🚐'})

    def welcome_menu
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        puts pastel.green(font.write("Van Manager"))
        # binding.pry
            welcome = $prompt.select("Please make a selection:", %w(Log_In Create_Account))
        if welcome == "Log_In"
            puts "Enter username:"
            user_name = gets.chomp
            @company = Company.find_by(user_name: user_name)
            load_profile
        else welcome == "Create_Account"
            @company = Company.create(user_name: user_name)
            create_profile
        end
        # binding.pry
    end

    # def proper_service
    #    if Van.mileage >= 5000 < 10000
    #     puts service1
    #    end
    # end

    def load_profile
        # puts company_name
        # built_fleet
            profile = $prompt.select("Please make a selection:", %w(View_Fleet Update_Vehicle_Mileage Exit))
        if profile == "Update_Vehicle_Mileage"
            update_existing_vans
        elsif profile == "View_Fleet"
            puts company.company_name
            existing_fleet
        else profile == "Exit"
            exit
        end
    end

    def update_existing_vans
        nick_names = company.vans.pluck(:nick_name)
        result = $prompt.select("Please choose the van you'd like to update.", nick_names)
        user_van_choice = Van.find_by(nick_name: result)
        puts "Enter updated mileage."
        new_mileage = gets.chomp
        user_van_choice.update(mileage: new_mileage)
        load_profile
    end

    def create_profile
        result = $prompt.collect do
            key(:user_name).ask('User Name?')
            key(:company_name).ask('Company Name?')
        end
        company.company_name = result[:company_name]
        build_fleet
    end

    def build_fleet
        puts "Please enter your fleet info below"
        response = $prompt.select("Please make a selection:", %w(Add_Van_to_Fleet View_Fleet Finished))
        if response == "Add_Van_to_Fleet"
            create_van
            build_fleet
        elsif response == "View_Fleet"
            existing_fleet
        else response == "Finished"
            puts "Thanks for building your fleet!"
        end
        
    end

    def create_van
        result = $prompt.collect do
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

    def existing_fleet
        # @service_id = VanService.service_id
        # @vanservice = VanService.find_by(service_id: @service_id)
        # binding.pry
        puts company.vans.pluck(:nick_name, :year, :make, :model, :mileage, :" ")
        profile = $prompt.select("Please make a selection:", %w(Update_Vehicle_Mileage Exit))
        if profile == "Update_Vehicle_Mileage"
            update_existing_vans
        else profile == "Exit"
            exit
        end
    end
end
