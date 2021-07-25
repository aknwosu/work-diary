# [WORKDIARY](https://work-diary-hi.herokuapp.com/)

Create/Sign in an account, and "clock in" to start tracking time

## Installation
Requires ruby 2.7.1
* Clone this repository

    	git clone git@github.com:aknwosu/work-diary.git

* Install 

		bundle install
		yarn install

* Prepare, migrate the database

		rake db:setup  
		rails db:migrate

* Run the Application

      rails s

### Process for approaching
	Bootstrapped a rails project and decided to work with more common/supported conventions like using postgres and adding rspec tests instead of the original minitests.

	Initially planned to build better checks for overlapping hours, options for users to update passwords, e.t.c but decided to stick to the basics of the requirements instead because I ran out of time

### Schema design
	Idea of having multiple users that own work logs of this type just worked well with relational database designs as there is finite information regarding actual work logs and it's quite easy to manage this way. Sql or NOSql would work. I chose what I had more experience using

### Improvements
	In a day;
		-  work on more tests
		-  reset password
		-  Calculation of hours worked is abit off
		-  Use proper timezones
	In a month;
		- Add information about users
		- Multiple users can belong to multiple organizations
		- No hour overlap regardless of what organization is currently being tracked for
		- Option to change timezones

