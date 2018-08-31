namespace :utils do

  desc "Setup Development"
  task setup_dev: :environment do
    images_path = Rails.root.join('public', 'system')

    puts "Executando o Setup para desenvolvimento..."
    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "APAGANDO IMAGENS DE public/system... #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake utils:generate_admins)
    puts %x(rake utils:generate_members)
    puts %x(rake utils:generate_ads)
    puts "Setup completado com sucesso!"
  end

  desc "Cria administradores fake"
  task generate_admins: :environment do
    puts "Cadastrando Administradores Fakes..."
    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,1].sample
      )
    end
    puts "Administradores Fakes criados com sucesso!"
  end

  desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    100.times do
      member = Member.new(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
      # member.build_profile_member

      #member.profile_member.first_name = Faker::Name.first_name
      #member.profile_member.second_name = Faker::Name.last_name

      member.save!
    end

    puts "MEMBROS cadastrados com sucesso!"
  end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(3),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts "Anúncios cadastrados com sucesso!"
  end
end
