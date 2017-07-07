#WaggieApp

Organizing information for change

This app was orchistrated with the following process in mind:
1.Attain an ability to create a user
2.Attain the ability to have that user log in
3.Authenticate any said user
4.Once Authenticated the said user needed to be sent to a primary dashboard
5.Create a session to keep the user logged in so that he can stay logged in & I can use it in the future as a matter of record keeping for a foreign key in other databases
6.Create the session as a restriction on the on all pages except ones used to create new users and login
7.use the dashboard as a means of searching an API for a specific type of animal in a specific Location
8.create an environmental variable so as to protect the API key
9.refer to the API in order to locate an animal and write it into POST in order to add it to a database
10.maintain a list within the dashboard with all of the animals a user is interested in
11.Be able to delete animals you are no longer interested in
12.create a second type of user that has ability to add to the database


The landing page gives you an option of two boxes of either LOGIN or CREATE new. HTTP method was used in order to facilitate the movement to the next page or either loging in with a current user or creating a new one.
Starting with creating a new user,
the POST method was used in order to facilitate movement of the information from the new user and password box to the database using ActiveRecord. This then updates the user and brings you to the Login page.
The login page is straight forward and lets you use input boxes for user name and password. This then is captured as params and sent through another POST method to check if the user name and password can be verified by the User table. If it is, it routs the user to their unique dashboard containing a search ability to look for more possible animals to adopt and their list of previous animals they liked.
The dashboard uses the input boxes to look through the API using a gem(which was required). This proved problematic at first as the way I was made to search was restricted to how the gem was created. I also learned that the API was a paying API for images. So I have forgone adding images to this project but have wrote in an image area to plug it in for future use.
