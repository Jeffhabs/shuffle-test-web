Shuffle Test
===========

A simple program that allows users to generate random-quiz questions for
CS1400 programming. 

- Source Site: http://web-shuffletest.rhcloud.com/

Features
===========

- login/logout
- Test
  - Filters
  - Batch Actions
  - Download
- Questions
  - Filters
  - Batch Actions
  - Download
- Categories
  - Filters
  - Batch Actions
  - Download
- Admin Users
  - Filters
  - Batch Actions
  - Download
- Comments
  - Filters
  - Batch Actions
  - Download
- Database
  - Insert
  - Delete
  - View

Installation
=============

- Source Site: http://web-shuffletest.rhcloud.com/

- Default Login: 
	USER:     admin@example.com
	PASSWORD: password

Create Admin User
=================
  - Click top menu "Admin Users"
  - Click "New Admin User"
  - Enter email in "EMAIL" field
  - Enter password in "PASSWORD" field
  - Confirm password in "PASSWORD CONFIRMATION" field
  - Submit by clicking "Create Admin User"

View Admin Users
================
  - Click top menu "Admin Users"
    //Can be sorted by EMAIL, CURRENT SIGN IN AT, SIGN IN COUNT, or CREATED AT 
  - Each Admin has individual options  by clicking "View", "Edit", or "Delete" 
  - Clicking on "View" displays admin user details and allows for commenting
  - Clicking on "Edit" directs you to change email and password screen
    //to update Admin Email password confirmation is required then "Update Admin      User" button may be pressed
  - Clicking on "Delete" removes the Admin in that row
  - Batch Actions allows selection of multiple Administrators for deletion

  - Sorting Administrators
    //Admin field can be sorted by EMAIL, CURRENT SIGN IN AT, SIGN IN COUNT, or       CREATED AT 
    - Email filter uses contains, equals, starts with, ends with, and text input      box
    - Current sign in filter uses date-picker
    - Sign In Count filter uses equals, greater than , less than, and text input      box
    - Created at filter users date-picker 
    - Click "Filter" to organize admin users
     //To reset filters press "Clear Filters" 

Categories
=============
  - Click top menu button "Categories" to view all categories
  - To filter categories use TITLE or CREATED AT
    - TITLE uses equals, starts with, ends with, and text input box
    - CREATED AT uses date-picker
  - Press filter to change what categories are displayed
   //Press "Clear Filters" to reset categories

  - Categories are organized by Id, Title, and Created At. 
  - Each category has view, edit, and delete options
    - View displays category details and allows commenting
    - Edit lets you change category title 
    - Delete removes that single category

  - To create a new category from category screen press "New Category"  
    - Input category title in the TITLE input box then press "Create Category"
     //can "Cancel" if needed

Questions
============
  - Click top menu button "Questions" to view all questions
  - Questions can be filtered by CATEGORY, QUESTION TYPE, TEXT, PROVIDED LANGUAGE,   and PROVIDED
  - CATEGORY filter uses equals, greater than, less than, and text input box
  - QUESTION TYPE filter uses contains, equals, starts with, ends with, and text    input box
  - TEST filter uses contains, equals, starts with, ends with, and text input box
  - PROVIDED LANGUAGE filter uses contains, equals, starts with, ends with, and     text input box
  - PROVIDED filter uses contains, equals, starts with, ends with, and text input   box
   //press "Filter" button to change questions display
 
  - Each questions contains view, edit, and delete options
  - Create new question press "New Question" button
    - Use category-picker to choose question category
    - Use type-picker to chose either Short Answer, Long Answer, or Multiple Choice
    - Use "Text" input box to type main question
    - Use "Provided Language" input box to type programming language name
    - Use "Provided" input box to give extra question details and examples
    - After all forms have input, press "Create Question" to save question
     //can cancel by pressing "Cancel"

Tests
===========
  - Click top menu button "Test" to view all tests
  - Each test has id, name, short question count, and long question count
  - Each test can be view, edited, or deleted
  - Test filter uses name
    - Name uses contains, equals, starts with, ends with, and text input box
    - Press "Filter" button to filter

  - Pressing "View" allows you to see test specific details and comments

  - Create new test press "New Test" button
    - In name form create a test name
    - In short question count form insert how many short questions desired
    - In long question count form insert how many long questions desired
    - The press "Create Test" button or "Cancel" to cancel
    
Batch Actions
==============
  - Each top menu button page allows batch actions for deleting multiple items 

Downloaded
==============
  - Each top menu button page allows downloads in CSV, XML, and JSON formats
