Original App Design Project
===

# PostCrate (Work in progress)

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Forget random links in your notes app or sending posts to yourself! Use PostCrate: a digital box for organizing and revisiting your favorite social media posts


### App Evaluation

PostCrate: 
- Mobile Experience: This app is made for mobile, letting you save and organize social media posts from different platforms.
- Uniqueness: It's not just a website; you can save, categorize, and search posts you typically interact with on a mobile phone all in ONE PLACE, making it more convenient.
- Story: This app is about helping you keep track of your favorite social media content from various platforms.
- Market: Many people might find it useful for managing their social media posts.
- Habit: If you actively save and organize posts, it could become a part of your daily routine.
- Scope: It might be a bit tricky to connect with different social platforms and search throughout all posts, but even a basic version for saving and categorizing posts is a good start.


## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- User can export social media post to PostCrate
- User can create categories to organize stored post
- User can move posts into different categories
- User can delete saved posts

**Optional Nice-to-have Stories**

- User can search through entire PostCrate to find a specific post 

### 2. Screen Archetypes


Login Screen
- User can login
  
Registration Screen
- User can create a new account

Home
- User can view categories of saved post
- User can click category to view all saved posts in that category

Category 
- Within a category User can click on saved post to either rewatch content or be redirected to a link to rewatch content (still deciding on this one)

Add category 
- User can create a new category 

Add Post
- User can either export from another app or insert a link to save a social media post (still deciding on this one)
- User can select which category to put saved post in
- User can create a new category to put saved post in 


### 3. Navigation

Tab Navigation - This is when the user switches between screens by simply clicking on a tab displayed at the top or bottom of the app.
Flow Navigation - This is when the user taps on something on a screen and is taken to another screen. From that screen, they can go back to the previous screen, or navigate to another screen.

**Tab Navigation** (Tab to Screen)
- Home
- Add post


**Flow Navigation** (Screen to Screen)

Login Screen
- => Home
  
Registration Screen
- => Home
  
Home Screen
- Click on category => Category
- Click on create new category => Add category
- Click on Add Post (tab navigation) => Add Post

Add category 
- Click on "add" button => Home

Add post 
- Click on "add" button => Home
  
Category
- Click on post => directs user to external app where the social media post is
- Hold down on post => move to new category or delete saved post (pop up maybe)
- Hold down on category name => edit category name (pop up maybe)

## Wireframes

![](AppWireframe.pdf)

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
