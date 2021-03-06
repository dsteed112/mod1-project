class Cli

    attr_reader :company, :service, :van
    $prompt = TTY::Prompt.new
    $pastel = Pastel.new

    def welcome_menu
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        puts pastel.green(font.write("Van Manager"))
            welcome = $prompt.select("Please make a selection:", %w(Log_In Create_Account), marker:"🚐")
        if welcome == "Log_In"
            puts "Enter username:"
            user_name = gets.chomp
            @company = Company.find_by(user_name: user_name)
            load_profile
        else welcome == "Create_Account"
            @company = Company.create(user_name: user_name)
            create_profile
        end
    end

    def load_profile
            profile = $prompt.select("Please make a selection:", %w(View_Fleet Update_Vehicle_Mileage Exit), marker:"🚐")
        if profile == "Update_Vehicle_Mileage"
            update_existing_vans
        elsif profile == "View_Fleet"
            puts $pastel.yellow("\n#{company.company_name}\n")
            existing_fleet
            
        else profile == "Exit"
            exit
        end
    end

    def update_existing_vans
        nick_names = company.vans.pluck(:nick_name)
        result = $prompt.select("Please choose the van you'd like to update.", nick_names, marker:"🚐")
        user_van_choice = Van.find_by(nick_name: result)
        puts "Enter updated mileage."
        new_mileage = gets.chomp
        user_van_choice.update(mileage: new_mileage)
        load_profile
    end

    def create_profile
        create_username_and_company
        build_fleet
    end

    def build_fleet
        puts "Please enter your fleet info below"
        response = $prompt.select("Please make a selection:", %w(Add_Van_to_Fleet View_Fleet Finished), marker:"🚐")
        if response == "Add_Van_to_Fleet"
            create_van
            build_fleet
        elsif response == "View_Fleet"
            existing_fleet
        else response == "Finished"
            puts "Thanks for building your fleet!"
        end 
    end

    def create_username_and_company
        result = $prompt.collect do
            key(:company_name).ask('Company Name:')
            key(:user_name).ask('Enter Desired Username:')
        end

        latest_company = Company.create(
            company_name: result[:company_name],
            user_name: result[:user_name]
        )
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
        company.reload
        company.vans.each do |van|
            puts "#{van.nick_name}\n#{van.year}\n#{van.make}\n#{van.model}\n#{van.mileage}\n"
            puts $pastel.red("#{service_needed(van.mileage)}\n\n")
        end

        profile = $prompt.select("Please make a selection:", %w(Update_Vehicle_Mileage Exit), marker:"🚐")
        if profile == "Update_Vehicle_Mileage"
            update_existing_vans
        else profile == "Exit"
            exit
        end
    end

    def service_needed(mileage)
        if mileage >= 5000 && mileage < 10000
            Service.find_by(name:"5k").description
        elsif mileage >= 10000 && mileage < 15000
            Service.find_by(name:"10k").description
        elsif mileage >= 15000 && mileage < 20000
            Service.find_by(name:"15k").description
        elsif mileage >= 20000 && mileage < 25000
            Service.find_by(name:"20k").description
        elsif mileage >= 25000 && mileage < 30000
            Service.find_by(name:"25k").description
        elsif mileage >= 30000 && mileage < 35000
            Service.find_by(name:"30k").description
        elsif mileage >= 35000 && mileage < 40000
            Service.find_by(name:"35k").description
        elsif mileage >= 40000 && mileage < 45000
            Service.find_by(name:"40k").description
        elsif mileage >= 45000 && mileage < 50000
            Service.find_by(name:"45k").description
        elsif mileage >= 50000 && mileage < 100000
            Service.find_by(name:"50k").description
        end
    end
end
