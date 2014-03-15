User.destroy_all
user_base = [{:first_name =>"David",
                :last_name => "Lohmann",
                :email => "dlohmann2014@kellogg.northwestern.edu",
                :password => "admin",
              },
              {:first_name =>"Jeff",
                :last_name => "Cohen",
                :email => "j-cohen@kellogg.northwestern.edu",
                :password => "hockey",
              },
              {:first_name =>"Brian",
                :last_name => "Eng",
                :email => "b-eng@kellogg.northwestern.edu",
                :password => "hockey",
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
                      :course_code => 442,
                      :title => 'Financial Decisions',
                      :description => "This course uses case studies to enhance the student's understanding of managerial financial decision making, specifically investment and financing decisions. Topics include short- and long-term financing, capital structure and dividend decisions, cost of capital, capital budgeting, firm valuation, financial and operational restructuring, and mergers and acquisitions. The course emphasizes the basic principles of corporate finance and is sufficiently general so as to be of interest to all students. The course provides students with the opportunity to apply the concepts and theories developed in other finance courses. At its most fundamental level, the course attempts to improve problem-solving skills: problem definition, gathering and organizing the relevant information, developing feasible alternative courses of action, evaluating alternative choices, and recommending and defending the best course of action.",
                    },
                    {:department_name => "KIEI",
                      :course_code => 462,
                      :title => 'New Venture Discovery',
                      :description => "The goal of New Venture Discovery is to help you better understand how high growth ventures are conceived, tested and validated and to give you frameworks, tools and practical advice to help you build your own business ideas.",
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
                    {:department_name => "ACCT",
                      :course_code => 444,
                      :title => 'Financial Planning for Mergers & Acquisitions',
                      :description => "Many companies are able to identify potential merger partners where combinations can result in significant synergies or value creation. But less than half are able to execute the merger to claim the value created. This course provides the technical knowledge necessary to identify targets as well as prepare business and law practitioners for their future collaborations in the mergers and acquisitions field. The course is offered jointly by the Kellogg School of Management and Northwestern's Law School and is primarily targeted for those interested in planning, analyzing, executing or facilitating corporate acquisitions. Topics include economics of mergers and acquisitions, securities law and anti-trust regulation, financial reporting issues, tax implications, and economic and legal considerations.",
                    },
                    {:department_name => "DECS",
                      :course_code => 450,
                      :title => 'Decision Making & Modeling',
                      :description => "This course presents a normative approach to making decisions in one's personal and professional life. The first half of the course introduces the fundamentals of decision analysis: probabilistic modeling, preference modeling, the five rules of actional thought, decision tree construction and rollback, and the value of imperfect and perfect information. The second half of the course emphasizes the use of these techniques to improve strategic decision-making. Topics include building good decision models, assessing probabilities and ranges, computing risk profiles, judging the sensitivity of decisions to risk attitude and assessed probabilities, and computing the value of better information that improves decisions.",
                    },
                    {:department_name => "HEMA",
                      :course_code => 441,
                      :title => 'Health Policy',
                      :description => "Health policy drives the American healthcare system. Every actor in the industry - whether one is working for a pharmaceutical, biotech or medical device firm, a provider or a payer - is affected by it. Health policy determines payment rates, access to technology, access to care and ultimately who lives or dies. Understanding the process of health policy-making in the United States and being able to influence that process are critical to the success of senior managers in our nation's health industry. This course establishes a conceptual framework for understanding health policy and the forces that shape it, details the health policy process so it can be understood and influenced, and examines in detail a number of critical health policy issues such as the Medicare drug benefit, the enhancement of access and the reimbursement for biotechnology products and medical devices. The highly interactive course features debates and panels, including some with leaders in healthcare policy.",
                    },
                    {:department_name => "MECN",
                      :course_code => 441,
                      :title => 'Competitive Strategy and Industrial Structure',
                      :description => "The course studies the determinants nature of competitive strategy in a variety of industry structures. The course considers how the structure of a firm's industry affects its strategic choices and performance. Topics include the dynamic aspects of pricing, entry and predation in concentrated industries, and product differentiation, product proliferation and innovation as competitive strategies.",
                    },
                    {:department_name => "KPPI",
                      :course_code => 441,
                      :title => 'Strategic Management in Non-Market Environments',
                      :description => "The explicit regulations and implicit norms governing a firm's market behavior are determined by myriad social, political, regulatory and legal institutions. These non-market institutions are arenas in which interest groups compete to change the rules to further their goals. This course takes the perspective of managers or consultants who must anticipate how interests and institutions within the non-market environment will react to new issues and develop strategies for affecting outcomes with the goal of improving firm performance. The course introduces students to a set of frameworks and tools that assist managers in non-market analysis and strategy development.",
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


Review.destroy_all
review = Review.new
review.course_id = Course.find_by(:title => "Startup Programming and Management").id
review.title = "It's Great!"
review.professor = "Cohen"
review.rating = 5
review.workload = "High"
review.focus = "Hard Skills"
review.cases = "Low"
review.user_id = User.find_by(:email => "j-cohen@kellogg.northwestern.edu").id
review.body = "In my humble opinion, this is the best class Kellogg has to offer!"
review.save

review = Review.new
review.course_id = Course.find_by(:title => "Startup Programming and Management").id
review.title = "It's Missing Something..."
review.professor = "Cohen"
review.rating = 4
review.workload = "Medium"
review.focus = "Hard Skills"
review.cases = "Low"
review.user_id = User.find_by(:email => "b-eng@kellogg.northwestern.edu").id
review.body = "The one thing this class could use is a little more facetime for Jeff's co-teacher. That guy knows his stuff!"
review.save

puts "There are now #{Review.count} reviews."
