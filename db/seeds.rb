# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

subjects = Subject.create([{ name: 'The Web' }, { name: 'Term Definitions' }, { name: 'The Command Line' }, { name: 'SQL & Databases' }, { name: 'Hypertext Markup Language' }, { name: 'Cascading Style Sheets' }, { name: 'Git: Version Control' }])

courses = Course.create([
	{
	name: 'Website Basics',
	url: 'http://teamtreehouse.com/library/websites/website-basics/website-basics',
	estimated_time: 1.5,
	subject_id: 1
	},	
	{
	name: 'Graphic Basics',
	url: 'http://teamtreehouse.com/library/websites/technology-foundations/graphic-basics',
	estimated_time: 2,
	subject_id: 1
	},	
	{
	name: 'Aesthetic Foundations',
	url: 'http://teamtreehouse.com/library/websites/aesthetic-foundations',
	estimated_time: 2.5,
	subject_id: 1
	},	
	{
	name: 'List',
	url: 'http://skillcrush.com',
	estimated_time: 0,
	subject_id: 2
	},	
	{
	name: 'Learn the Command Line the Hard Way',
	url: 'http://cli.learncodethehardway.org/book/',
	estimated_time: 3,
	subject_id: 3
	},
	{
	name: 'Command Line Basics',
	url: 'http://blog.teamtreehouse.com/command-line-basics',
	estimated_time: 0.5,
	subject_id: 3
	},
	{
	name: 'Bash Basics',
	url: 'https://gist.github.com/a8a7ca963e37e0b108b9',
	estimated_time: 0.5,
	subject_id: 3
	},
	{
	name: 'Learn SQL the Hard Way',
	url: 'http://sql.learncodethehardway.org/book/',
	estimated_time: 4,
	subject_id: 4
	},

	{
	name: 'Google\'s MySQL Tutorial',
	url: 'http://code.google.com/edu/tools101/mysql.html',
	estimated_time: 2,
	subject_id: 4
	},
	{
	name: 'HTML & CSS tutorial',
	url: 'http://learn.shayhowe.com/html-css/',
	estimated_time: 2,
	subject_id: 5
	},
	{
	name: 'Treehouse HTML basics',
	url: 'http://teamtreehouse.com/library/websites/html',
	estimated_time: 6,
	subject_id: 5
	},
	{
	name: 'Advanced HTML5 & CSS3',
	url: 'http://www.codeschool.com/courses/functional-html5-css3',
	estimated_time: 6,
	subject_id: 5
	},
	{
	name: 'CSS Foundations',
	url: 'http://teamtreehouse.com/library/websites/css-foundations',
	estimated_time: 6,
	subject_id: 6
	},


	{
	name: 'CSS Cross Country',
	url: 'http://www.codeschool.com/courses/css-cross-country',
	estimated_time: 6,
	subject_id: 6
	},


	{
	name: 'CSS3 on Treehouse',
	url: 'http://teamtreehouse.com/library/websites/css3',
	estimated_time: 6,
	subject_id: 6
	},


	{
	name: 'Responsive Websites',
	url: 'http://teamtreehouse.com/library/websites/build-a-responsive-website/',
	estimated_time: 4,
	subject_id: 6
	},


	{
	name: 'Try Git',
	url: 'http://www.codeschool.com/courses/try-git',
	estimated_time: 1,
	subject_id: 7
	},


	{
	name: 'Git Real',
	url: 'http://www.codeschool.com/courses/git-real',
	estimated_time: 3,
	subject_id: 7
	},

	{
	name: 'Git Immersion',
	url: 'http://gitimmersion.com/',
	estimated_time: 3,
	subject_id: 7
	},


	{
	name: 'The Git Book',
	url: 'http://git-scm.com/book',
	estimated_time: 6,
	subject_id: 7
	},

	{
	name: 'Git Videos',
	url: 'http://git-scm.com/videos',
	estimated_time: 1,
	subject_id: 7
	},


	])