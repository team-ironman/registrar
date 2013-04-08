# encoding: utf-8

namespace :default_data  do
  desc "create default data"

  task :destroy_all => :environment do
    AdminUser.destroy_all
    User.destroy_all
    Subject.destroy_all
    Course.destroy_all
    CourseProvider.destroy_all
    Event.destroy_all
    EventType.destroy_all
    Semester.destroy_all
  end

  task :create_all => [:environment, 
    :admin_users, 
    :users,
    :subjects,
    :course_providers,
    :courses,
    :event_types,
    :events,
    :semesters
    ] do
  end


  task :admin_users => :environment do
    AdminUser.create([
      { :email => "admin@example.com", :password => "password", :password_confirmation => "password", :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 0, :current_sign_in_at => nil, :last_sign_in_at => nil, :current_sign_in_ip => nil, :last_sign_in_ip => nil, :created_at => nil, :updated_at => nil }
    ], :without_protection => true )
  end

  task :users => :environment do
    User.create([
      { :email => "masha.rikhter@flatironschool.com", :codeschool_login => "mrikhter", :treehouse_login => "masharikhter", :created_at => "2013-03-27 18:23:52", :updated_at => "2013-03-27 18:23:52", :phone_number => "404-966-1321", :first_name => "Masha", :last_name => "Rikhter", :password_digest => "$2a$10$BgvkMx9pfcNAOQXz.gcbxuXi/PbxyuXCy4ultWLJGfPf4pAZHKYxy" },
      { :email => "hunternz@gmail.com", :codeschool_login => "aspectratio", :treehouse_login => "aspectratio", :created_at => "2013-03-27 18:25:18", :updated_at => "2013-03-27 18:25:18", :phone_number => "347 875 7279", :first_name => "Tim", :last_name => "Hunter", :password_digest => "$2a$10$iOAYY0TZT6j9eX65iENNne2WGDRUy/OzfuZvQ5iGISkkxNz.fBTlu" },
      { :email => "email.erin@gmail.com", :codeschool_login => "erinlee", :treehouse_login => "erinlee", :created_at => "2013-03-27 18:26:47", :updated_at => "2013-03-27 18:26:47", :phone_number => "555-112-1234", :first_name => "jose", :last_name => "rodriguez", :password_digest => "$2a$10$Im6mcMwM9aRLRVMG2nLGHumZ3f/dpfKU7ksoe5MskFWlnOu8P6V9O" },
      { :email => "daniel.gantz@gmail.com", :codeschool_login => "firstgeneration", :treehouse_login => "firstgeneration", :created_at => "2013-03-27 18:29:15", :updated_at => "2013-03-27 18:29:15", :phone_number => "123-456-7890", :first_name => "Daniel", :last_name => "Gantz", :password_digest => "$2a$10$hh6na1AEYkp/8gm81bcYSOrF6OaE0esGz3cCqb/RyAbTyWQl0wyO6" },
      { :email => "tyebud@gmail.com", :codeschool_login => "tylermdavis", :treehouse_login => "tylerdavis", :created_at => "2013-03-27 18:41:27", :updated_at => "2013-03-27 18:41:27", :phone_number => "8583540054", :first_name => "Tyler", :last_name => "Davis", :password_digest => "$2a$10$SEGrwOq4F3hF0bvngNgJWuXc1JnUpz6oqobPE6giZ0a2MbWsu/N6e" },
      { :email => "victoria.m.friedman@gmail.com", :codeschool_login => "victoriamfriedman", :treehouse_login => "victoriafriedman", :created_at => "2013-03-27 18:43:27", :updated_at => "2013-03-27 18:43:27", :phone_number => "434-466-1525", :first_name => "Victoria", :last_name => "Friedman", :password_digest => "$2a$10$pcXCP.jkHZ7fYQdAepyMDu0MXbZjDSJBsGo5fqGTuFBDP5uL4nRJ2" }
    ], :without_protection => true )
  end

  task :subjects => :environment do
    Subject.create([
      { :name => "The Web", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "The goal of this section is for you to understand the basics of the web. What web servers are, how code is interpreted, basic things like that." },
      { :name => "Term Definitions", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => nil },
      { :name => "The Command Line", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "Familiarity with a shell environment is crucial to being a functional developer. There are no good interactive tutorials for command lines, so complete the following reading." },
      { :name => "SQL & Databases", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "This section is all about understanding what databases are and how to query them for data." },
      { :name => "Hypertext Markup Language", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "The source of all content on the web, HTML is a crucial markup syntax to understand. We will be covering very little HTML through the course and we seriously expect you to know what the basic tags are and when to use them." },
      { :name => "Cascading Style Sheets", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "While HTML tells the browser what different parts of the page are, CSS says what those pieces should look like." },
      { :name => "Git: Version Control", :created_at => "2013-03-20 00:29:03", :updated_at => "2013-03-20 00:29:03", :display_order => 0, :description => "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency." },
      { :name => "Basics", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => "Certain aspects of coding are fundamental, learn them through javascript and ruby." },
      { :name => "Javascript", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => "" },
      { :name => "Ruby", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => "\"My conscience won’t let me call Ruby a computer language. That would imply that the language works primarily on the computer’s terms. That the language is designed to accomodate the computer, first and foremost. That therefore, we, the coders, are foreigners, seeking citizenship in the computer’s locale. It’s the computer’s language and we are translators for the world.\n\nBut what do you call the language when your brain begins to think in that language? When you start to use the language’s own words and colloquialisms to express yourself. Say, the computer can’t do that. How can it be the computer’s language? It is ours, we speak it natively!\n\nWe can no longer truthfully call it a computer language. It is coderspeak. It is the language of our thoughts.\"\n\n_why's poignant guide to ruby" },
      { :name => "Rails", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => nil },
      { :name => "Testing", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => nil },
      { :name => "Best Practices", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :display_order => 0, :description => nil }
    ], :without_protection => true )
  end



  task :course_providers => :environment do
    CourseProvider.create([
      { :name => "code school", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17" },
      { :name => "treehouse", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17" },
      { :name => "other", :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17" }
    ], :without_protection => true )
  end


  task :courses => :environment do
    Course.create([
      { :name => "Website Basics", :url => "http://teamtreehouse.com/library/websites/website-basics", :estimated_time => 1.5, :subject_id => 1, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 17:29:53", :treehouse_badges => 1, :course_provider_id => 2, :days_due_before_class => 28, :description => "Beyond HTML and CSS, there are several basic technology skills that every web professional should know. Some of these include uploading files to the web via FTP or purchasing domains and hosting." },
      { :name => "Technology Foundations", :url => "http://teamtreehouse.com/library/websites/technology-foundations", :estimated_time => 2.0, :subject_id => 1, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 17:29:53", :treehouse_badges => 1, :course_provider_id => 2, :days_due_before_class => 28, :description => "Graphic basics is for developers and designers alike, to become familiar with the difference between vector and raster, units and increments and saving for the web." },
      { :name => "Aesthetic Foundations", :url => "http://teamtreehouse.com/library/websites/aesthetic-foundations", :estimated_time => 2.5, :subject_id => 1, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:04", :treehouse_badges => 3, :course_provider_id => 2, :days_due_before_class => 28, :description => "Aesthetic Foundations will cover the elements and principles of art, along with color theory. This basic knowledge will provide a design language that enables more effective communication amongst designers and other team members." },
      { :name => "Learn the Command Line the Hard Way", :url => "http://cli.learncodethehardway.org/book/", :estimated_time => 3.0, :subject_id => 3, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => "The venerable Zed Shaw gives us a short book about your shell." },
      { :name => "Command Line Basics", :url => "http://blog.teamtreehouse.com/command-line-basics", :estimated_time => 0.5, :subject_id => 3, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => nil },
      { :name => "Bash Basics", :url => "https://gist.github.com/a8a7ca963e37e0b108b9", :estimated_time => 0.5, :subject_id => 3, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => nil },
      { :name => "Learn SQL the Hardway", :url => "http://sql.learncodethehardway.org/book/", :estimated_time => 4.0, :subject_id => 4, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => nil },
      { :name => "Google's MySQL Tutorial", :url => "http://code.google.com/edu/tools101/mysql.html", :estimated_time => 2.0, :subject_id => 4, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => nil },
      { :name => "HTML & CSS Tutorial", :url => "http://learn.shayhowe.com/html-css/", :estimated_time => 2.0, :subject_id => 5, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 28, :description => "This is a beautiful guide that we recommend everyone read through as quickly as possible. Don't worry if you don't fully grok this, the Treehouse unit below covers all this through videos and tests." },
      { :name => "HTML", :url => "http://teamtreehouse.com/library/websites/html", :estimated_time => 6.0, :subject_id => 5, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:08", :treehouse_badges => 7, :course_provider_id => 2, :days_due_before_class => 28, :description => "This HTML tutorial helps you master HTML. Mastering HTML and its many elements is critical for any type of web professional. HTML or 'Hyper Text Markup Language' describes the basic structure and content of a web page." },
      { :name => "Functional HTML5 & CSS3", :url => "http://www.codeschool.com/courses/functional-html5-css3", :estimated_time => 6.0, :subject_id => 5, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 28, :description => "If you are familiar with HTML & CSS already and were able to complete the Treehouse unit pretty easily, we recommend you try this unit. Especially if you are into aesthetics and advanced behaviors as it covers some amazing features of HTML & CSS." },
      { :name => "CSS Foundations", :url => "http://teamtreehouse.com/library/websites/css-foundations", :estimated_time => 6.0, :subject_id => 6, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:09", :treehouse_badges => 8, :course_provider_id => 2, :days_due_before_class => 28, :description => "Cascading Style Sheets (CSS) is a language used to describe the visual look of a web page. Using CSS, it is possible to change colors, margin, padding, fonts, and much more." },
      { :name => "CSS3", :url => "http://teamtreehouse.com/library/websites/css3", :estimated_time => 4.0, :subject_id => 6, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 19:25:56", :treehouse_badges => 11, :course_provider_id => 2, :days_due_before_class => 21, :description => "CSS3 (Cascading Style Sheets 3) is a superset of CSS that adds many new constructs and properties. Support for CSS3 is rapidly improving across all major browsers, making it a critical piece of technology for modern web professionals." },
      { :name => "Build a Responsive Website", :url => "http://teamtreehouse.com/library/websites/build-a-responsive-website/", :estimated_time => 4.0, :subject_id => 6, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:10", :treehouse_badges => 5, :course_provider_id => 2, :days_due_before_class => 21, :description => "The Smells Like Bakin' cupcake company needs their website to work on tablets and phones. We will modify the code of their pre-existing website so that it is flexible and fits beautifully into a wide variety of screen resolutions and devices." },
      { :name => "Try Git", :url => "http://www.codeschool.com/courses/try-git", :estimated_time => 1.0, :subject_id => 7, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 21, :description => "Get an introduction to the basic concepts of Git version control." },
      { :name => "Git Real", :url => "http://www.codeschool.com/courses/git-real", :estimated_time => 4.0, :subject_id => 7, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 21, :description => "A more advanced introduction to the core of version control with Git." },
      { :name => "Git Immersion", :url => "http://gitimmersion.com/", :estimated_time => 3.0, :subject_id => 7, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 21, :description => "Git Immersion is a guided tour that walks through the fundamentals of Git, inspired by the premise that to know a thing is to do it." },
      { :name => "The Git Book", :url => "http://git-scm.com/book", :estimated_time => 6.0, :subject_id => 7, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 21, :description => "The entire Pro Git book, written by Scott Chacon and published by Apress, is available here." },
      { :name => "Git Videos", :url => "http://git-scm.com/videos", :estimated_time => 1.0, :subject_id => 7, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 21, :description => "Four videos covering some basics from the creators and maintainers of Git." },
      { :name => "Try Ruby", :url => "http://www.codeschool.com/courses/try-ruby", :estimated_time => 1.0, :subject_id => 10, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 21, :description => "Ruby is a programming language from Japan (available at ruby-lang.org) which is revolutionizing the web. The beauty of Ruby is found in its balance between simplicity and power. This interactive tutorial is maintained by CodeSchool but was originally by the legend _why_the_lucky_stiff." },
      { :name => "JavaScript Foundations", :url => "http://teamtreehouse.com/library/websites/javascript-foundations", :estimated_time => 6.0, :subject_id => 9, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:11", :treehouse_badges => 6, :course_provider_id => 2, :days_due_before_class => 21, :description => "Learn the fundamentals to the JavaScript Language. JavaScript is the key to programming in the browser, mastering jQuery, and building apps with Node.js. You will learn how to program effectively in JavaScript, the different types, functions, and techniques for writing solid JavaScript. You will benefit from taking Introduction to Programming if you don't have much experience with programming." },
      { :name => "jQuery Air: First Flight", :url => "http://www.codeschool.com/courses/jquery-air-first-flight", :estimated_time => 6.0, :subject_id => 9, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 21, :description => "Simplify web development with the amazing javascript library jQuery, in use by over 220 million websites." },
      { :name => "jQuery Air: Captain's Log", :url => "http://www.codeschool.com/courses/jquery-air-captains-log", :estimated_time => 6.0, :subject_id => 9, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 14, :description => "Now that you've got the basics of javascript and jquery, take flight as a captain of the browser (or something)!" },
      { :name => "Learn to Program", :url => "http://pine.fm/LearnToProgram/", :estimated_time => 10.0, :subject_id => 10, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 14, :description => "Chris Pine's Learn to Program is a classic book that is mostly available online for free. Read it all. Then buy it and read it again." },
      { :name => "Ruby Foundations", :url => "http://teamtreehouse.com/library/programming-2/ruby-foundations", :estimated_time => 10.0, :subject_id => 10, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:14", :treehouse_badges => 14, :course_provider_id => 2, :days_due_before_class => 14, :description => "Learn the fundamentals to become a Ruby and Rails developer. You'll learn things like what Ruby is, how to write object oriented Ruby, classes and modules, programming structures and types, and more. There are no requirements for this course other than a web browser and willingness to learn." },
      { :name => "Ruby Bits", :url => "http://www.codeschool.com/courses/ruby-bits", :estimated_time => 6.0, :subject_id => 10, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 14, :description => "Learn all the little bits that make Ruby one of the most popular programming languages amongst non-programmers and programmers alike." },
      { :name => "Getting Started with Rails Guide", :url => "http://guides.rubyonrails.org/getting_started.html", :estimated_time => 2.0, :subject_id => 11, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 0, :days_due_before_class => 14, :description => "This guide covers getting up and running with Ruby on Rails. After reading it, you should be familiar with: Installing Rails, creating a new Rails application, and connecting your application to a database. The general layout of a Rails application. The basic principles of MVC (Model, View Controller) and RESTful design. How to quickly generate the starting pieces of a Rails application." },
      { :name => "Rails for Zombies Redux", :url => "http://www.codeschool.com/courses/rails-for-zombies-redux", :estimated_time => 4.0, :subject_id => 11, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 7, :description => "Ruby on Rails, the most popular framework in-use by Zombies. That's right, you can basically be brain dead and use Ruby on Rails. No offense to brain dead people or zombies." },
      { :name => "Rails for Zombies 2", :url => "http://www.codeschool.com/courses/rails-for-zombies-2", :estimated_time => 4.0, :subject_id => 11, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 7, :description => "In part 2 of Rails for Zombies, you learn even more about how to use this amazing framework as the undead." },
      { :name => "Build a Simple Ruby on Rails Application", :url => "http://teamtreehouse.com/library/programming-2/build-a-simple-version-of-facebook", :estimated_time => 12.0, :subject_id => 11, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-22 14:56:15", :treehouse_badges => 9, :course_provider_id => 2, :days_due_before_class => 7, :description => "That's right, in theory, if you've gotten this far, you are ready to make a billion dollars and build a simple version of Facebook!" },
      { :name => "Testing with RSpec", :url => "http://www.codeschool.com/courses/testing-with-rspec", :estimated_time => 0.0, :subject_id => 12, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 7, :description => "Write code that tests your code. If it seems like a post-modern nightmare, that's because it sort of is." },
      { :name => "Rails Testing for Zombies", :url => "http://www.codeschool.com/courses/rails-testing-for-zombies", :estimated_time => 0.0, :subject_id => 12, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 7, :description => "After eating all these brainz, you're probably pretty smart. Now learn how to prove that your code works." },
      { :name => "Rails Best Practices", :url => "http://www.codeschool.com/courses/rails-best-practices", :estimated_time => 0.0, :subject_id => 13, :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17", :treehouse_badges => nil, :course_provider_id => 1, :days_due_before_class => 7, :description => "Any fool can write code for machines, it takes a programmer to write code for humans." }
    ], :without_protection => true )
  end

  task :event_types => :environment do
    EventType.create([
      { :name => "NYC on Rails", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" },
      { :name => "Flatiron Bonding Events", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" },
      { :name => "Blog Post", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" },
      { :name => "Speaker", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" },
      { :name => "Techie Event", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" },
      { :name => "NYC on Rails Presenter", :created_at => "2013-03-27 20:15:01.775631", :updated_at => "2013-03-28 18:21:20.747612" }
    ], :without_protection => true )
  end

  task :events => :environment do
    Event.create([
      { :name => "NYC on Rails", :start_at => "2013-03-28 19:00:00", :end_at => "2013-03-28 21:00:00", :created_at => "2013-03-26 18:04:56", :updated_at => "2013-03-26 18:04:56", :location => nil, :address => nil, :event_type_id => 1 }
    ], :without_protection => true )
  end

  task :semesters => :environment do
    Semester.create([
      { :start => DateTime.new(2013,2,4), :end => DateTime.new(2013,4,26), :name => 'Spring 2013', :created_at => "2013-03-28 19:56:17", :updated_at => "2013-03-28 19:56:17" }
    ], :without_protection => true )
  end

end
