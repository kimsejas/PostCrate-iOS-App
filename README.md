CodePath iOS 101 Course Final Project
===

# PostCrate

## Demo


https://github.com/kimsejas/ios101-milestone1/assets/109777428/dec9b6f7-b638-4a0e-a772-6aaf4c5cfbc6


## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Sprint Planning and Development](#Sprint-Planning-and-Development)

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

![image](https://github.com/kimsejas/ios101-milestone1/assets/109777428/856d17a0-d0bf-4e09-a02e-6e89dc821651)


## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

##  Sprint Planning and Development

## Step 1: Identify Main Features
- User login and create account
- Local data persistence
- Home screen with all categories
- Add category screen
- Add post screen (API possibly)
- Detailed category screen

## Step 2: Breakdown into Sprints

Week 8 Sprint 1: Set up the project and login/create account screen with local data persistence by Tuesday Nov 7th
- Achieved: Working login and registration views. Here's a video demo https://www.loom.com/share/6a09e269d16b450cba3a73d10d748d90?sid=2a401d03-d864-48af-9a88-52eb4a3bf303 
- Challenges faced: figuring out how to have saved data for each user 
- What's next: update the design of the screens and build homescreen with post and category objects 

Week 9 Sprint 2: Build Home Screen and Add Post Screen (figure out API) by Tuesday Nov 14th
- Achieved: Home screen with categories and detailed category view with posts. When posts are clicked users are taken to the original social media post. Here's a demo video: https://www.loom.com/share/a74a56635ba447e2b4f48bd1da98e715?sid=20cc88af-2e77-4250-8217-86c0c51ba8a0 
- Challenges faced: figuring out how get the cover image from a social media post link into the post table view cell.
- What's next: getting the cover image from a post url into the app. adding functionality to delete/edit categories and delete/move posts from categories

Week 10 Sprint 3: Build Detailed Category Screen and Add Category Screen by Tuesday Nov 21st
- Achieved: Added photos to the posts view using Tumblr's API. Here's a demo video: https://www.loom.com/share/b05d0eeaba6c465fa91e2a47ba51e384?sid=3ee162e3-549e-4342-a5f5-49ca072618d9
- Challenges faced: Figuring out how to make an API call with the pasted URL from the user.
- What's next: Adding APIs from other social media platforms and delete/edit categories


