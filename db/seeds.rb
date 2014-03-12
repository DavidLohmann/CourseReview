User.destroy_all
user_base = [{:first_name =>"David",
                :last_name => "Lohmann",
                :email => "dlohmann2014@kellogg.northwestern.edu",
                :password => "admin",
                :city => "Evanston",
                :state => "IL",
              },
              {:first_name =>"Jeff",
                :last_name => "Cohen",
                :email => "j-cohen@kellogg.northwestern.edu",
                :password => "hockey",
                :city => "Evanston",
                :state => "IL",
              },
              {:first_name =>"Brian",
                :last_name => "Eng",
                :email => "b-eng@kellogg.northwestern.edu",
                :password => "hockey",
                :city => "Chicago",
                :state => "IL",
              },
            ]

  user_base.each do |user_info|
    u = User.new
    u.first_name = user_info[:first_name]
    u.last_name = user_info[:last_name]
    u.email = user_info[:email]
    u.password = user_info[:password]
    u.city = user_info[:city]
    u.state = user_info[:state]
    u.save
end

puts "There are now #{User.count} users in the database."


Department.destroy_all
["ACCT", "BLAW", "DECS", "FINC", "HEMA", "INTL", "KIEI", "KPPI", "MECN", "MEDM", "MGMT", "MKTG", "MORS", "OPNS", "REAL"].each do |department_name|
  d = Department.new
  d.name = department_name
  d.save
end

puts "There are now #{Department.count} departments in the database."


Course.destroy_all
course_list = [
                    {:department_name => "KIEI",
                      :course_code => 925,
                      :title => 'Startup Programming and Management',
                      :description => "This course provides students with an introduction to web development and software project management.",
                    },
                    {:department_name => "BLAW",
                      :course_code => 911,
                      :title => 'Business Law for Entrepreneurs',
                      :description => "This course provides the would-be entrepreneur with a working knowledge of certain essential substantive areas of the law and the ability to work with and use lawyers effectively. The focus is on the practical legal considerations in forming and sustaining an entrepreneurial enterprise, including entity organization, not-for-profit securities laws, employment benefits, financing, taxation and intellectual property law.",
                    },
                    {:department_name => "FINC",
                      :course_code => 441,
                      :title => 'Finance II',
                      :description => "Corporate Finance (FINC-441) covers the financial knowledge you need to run a firm, whether the firm is a multi-billion international conglomerate or a three-person start up. You will learn how to answer the three fundamental question of corporate finance. (1) Capital structure or the funding decision: which source(s) of capital should you use to fund the firm’s project? (2) Capital budgeting or the investment decision: which projects should you invest in? (3) Dividend decision: how should you deploy the capital that the project returns.",
                    },
                    {:department_name => "KIEI",
                      :course_code => 462,
                      :title => 'New Venture Discovery',
                      :description => "The goal of New Venture Discovery is to help you better understand how high-growth ventures are conceived, tested and validated—and to give you frameworks, tools and practical advice to help you build your own business ideas.",
                    },
                    {:department_name => "MGMT",
                      :course_code => 452,
                      :title => 'Strategy & Organization',
                      :description => "This course focuses on the link between organizational structure and strategy, making heavy use of the microeconomic tools taught in MECN-430. The core question students address is how firms should be organized to achieve their performance objectives. The first part of the course takes the firm's activities as given and studies the problem of organizational design; topics may include incentive pay, decentralization, transfer pricing, and complementarities. The second part examines the determinants of a firm's boundaries and may cover such topics as outsourcing, horizontal mergers, and strategic commitment.",
                    },
                    {:department_name => "MKTG",
                      :course_code => 466,
                      :title => 'Marketing Strategy',
                      :description => "This course presents an integrative, dynamic view of competitive brand strategy. It focuses on understanding, developing and evaluating brand strategies over the life of a product market. A framework for developing marketing strategies that yield a distinctive competitive advantage based on customer and competitor analysis will be presented and applied in various situations throughout the course. Topics include strategies for pioneering brands, strategies for late entry, growth strategies, strategies for mature and declining markets, and defensive marketing strategies. Material is presented using a mix of cases, lectures and a computer simulation game called MARKSTRAT.",
                    },
                  ]

course_list.each do |course_info|
  c = Course.new
  c.course_code = course_info[:course_code]
  c.title = course_info[:title]
  c.description = course_info[:description]

  department = Department.find_by(:name => course_info[:department_name])
  c.department_id = department.id
  c.save
end

puts "There are now #{Course.count} courses in the catalog."
