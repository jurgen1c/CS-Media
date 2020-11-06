# Crowd Sourced Media Website


![](https://img.shields.io/badge/Microverse-blueviolet)



> Ruby's on Rails Crowd Sourced Media Website Project 

## Concept
>  The concept behind this project is to combat the slew of fake news nad general mistrust they have created in the publlic eye. To achieve this my app require any user to add atleast one source, though more can be added, to justify their articles content, this can be a video, audio or pdf. Further more users can create reviews for articles either verifying whats is stated or exposeing it as misinformation, all reviews can have attached files as well. Finally user may vote for articles with good verified content to promote a more secure article heirarchy. 
## Usage

- This project intends to practice my skills building a full working MVP;
- Prepare data architecture documentation;
- Working with deployment to Heroku.
- Working Amazon S3 services<br>

## Live Demo

[Project live website](https://crowd-sourced-media.herokuapp.com/)



   
  
## 🛠 Getting Started

> To get a local copy up and running follow these simple example steps.

- Go to the main page of the repo.
- Copy this Code `https://github.com/jurgen1c/CS-Media.git`




### 📝 Setup

 - Open a terminal
 
 - Copy this code : 
        ```
        git clone https://github.com/jurgen1c/CS-Media.git
        ```
 - Copy this code to install the gems :
         ```
        bundle install
        ```
 - Copy this code to migrate th db :
 
        ```
        rails db:create && rails db:migrate && rails db:seed
               
        
- Visit `http://localhost:3000`

### 📝 What you will find:
   1. The user logs in to the app, Use: `sanad@sandoog.com` as email, and `123456` as password :)
   
   <br>
   
   ![](app/assets/images/home.png)
   2. The user is presented with the homepage that includes:
       1. Top menu with links and search.
       2. *Popular Articles* carousel in the centre .
       3. Categories with backgrounds.
       4. Categories pills with articles ordered by most recent
       
       <br>
       
       ![](app/assets/images/article.png)
   3. The *Article* section includes:
       1. Nav tabs
       2. First tab displays article content and comments + comment form
       3. Second Article Sources
       4. Third article reviews and new review form
       1. Article author and info
       
       <br>
       
       ![](app/assets/images/user.png)
   4. The user profile includes
       1. User info
       2. Followers
       3. User Articles
   
### Automated Tests

- In root directory copy this into your terminal:
            ```
           bundle exec rspec
            ```
- All the test should pass   

### Build With

- Ruby 2.7.0p0
- Ruby on Rails 6.0.3

### Deployed On:
- Heroku
- Amazon S3         

## 👤 Authors


👤 **Jurgen Clausen Gutierrez**

- Github: [@jurgen1c](https://github.com/jurgen1c)
- LinkedIn: [jurgen-clausen](https://www.linkedin.com/in/jurgen-clausen-2740061a9/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Microverse
- etc

## 📝 License

This project is [MIT](lic.url) licensed.
