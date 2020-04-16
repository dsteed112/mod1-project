class Cli

    attr_reader :company

    def welcome_menu
        puts "Welcome to Vehicle Fleet Maintenance Manager"
        # binding.pry
            prompt = TTY::Prompt.new
            welcome = prompt.select("Please make a selection:", %w(Log_In Create_Account))
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

    def load_profile
        # puts company_name
        # built_fleet
            prompt = TTY::Prompt.new
            profile = prompt.select("Please make a selection:", %w(View_Fleet Update_Vehicle_Info Exit))
        if profile == "Update_Vehicle_Info"
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
        prompt = TTY::Prompt.new
        result = prompt.select("Please choose the van you'd like to update.", nick_names)
        user_van_choice = Van.find_by(nick_name: result)
        puts "Enter updated mileage."
        new_mileage = gets.chomp
        user_van_choice.update(mileage: new_mileage)
        load_profile
    end

    def create_profile
        prompt = TTY::Prompt.new
        result = prompt.collect do
            key(:user_name).ask('User Name?')
            key(:company_name).ask('Company Name?')
        end
        company.company_name = result[:company_name]
        build_fleet
    end

    def build_fleet
        puts "Please enter your fleet info below"
        prompt = TTY::Prompt.new
        response = prompt.select("Please make a selection:", %w(Add_Van_to_Fleet View_Fleet Finished))
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

    def existing_fleet
        puts company.vans.pluck(:nick_name, :year, :make, :model, :mileage, :" ")
        prompt = TTY::Prompt.new
            profile = prompt.select("Please make a selection:", %w(Update_Vehicle_Info Exit))
        if profile == "Update_Vehicle_Info"
            update_existing_vans
        else profile == "Exit"
            exit
        end
    end


    # def exit
    # end

end
