# Techtonica Mock Interview Question Randomizer

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Contents

- About
- Tech Stack
- Features
- Installation
- Future Development
- Acknowledgements

## About the Randomizer

Daydreams about improving the mock interview process made manifest in a full-stack app styled to resemble the Techtonica.org website. Written to revise the current process wherein volunteers choose from a static list of 10 sample code challenges for every mock interview, participants at Techtonica can share their screens and generate a randomly selected code challenge question to work through. Participants can also mark questions as complete, and refer back to those questions later as well.

## Tech Stack

<table align="center">
  <tr>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168923681-ece848fc-5700-430b-957f-e8de784e9847.png" width="48" height="48" alt="html" />
      <br>html
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168924521-589f95da-069a-496a-bcc1-ee6dd132ff12.png" width="48" height="48" alt="CSS" />
      <br>CSS
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168977094-6a5073a2-2f48-4f5a-ae0e-ed1421a678c6.png" width="48" height="48" alt="JavaScript" />
      <br>JavaScript
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168976819-15a1f4e0-29cf-4ac0-94a7-1f15eee374a1.png" width="48" height="48" alt="postgreSQL" />
      <br>postgreSQL
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168978951-5ac2af5e-c911-4e59-b493-683071cf1860.png" width="48" height="48" alt="Express" />
      <br>Express
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168979311-4a486cad-32c8-46f4-a5da-912fdc51b2d6.png" width="48" height="48" alt="React" />
      <br>React
    </td>
    <td align="center" width="96">
        <img src="https://user-images.githubusercontent.com/74997368/168979848-733f7090-0f78-401a-9ceb-4267231abef7.png" width="48" height="48" alt="Node" />
      <br>Node
    </td>
     <td align="center" width="96">
        <img src="https://cdn.iconscout.com/icon/free/png-512/free-sequelize-2-1175003.png?f=avif&w=256" width="48" height="48" alt="Sequelize" />
      <br>Sequelize
    </td>
  
  </tr>
</table>


## Installation
1. After cloning the repo locally, navigate to the root directory in your terminal and remove owner git with the command `rm -rf .git`. Be sure to reinitialize git so that you can track changes.
2. Create a database named `mock_interview` so that when you launch the server for the project, the Sequelize models can generate the tables necessary to run the project.
3. Run `npm install` to install the dependencies for the project.
4. Navigate to the server directory and run `npm start` to run the server on localhost:8088.
5. In a new terminal from the root directory run the command `npm run build` which will run the development build.
7. Next run the command `npm start` to launch the client on localhost:3000.


## Future Development 

- SQL command logic to prevent saved questions from getting generated randomly
- Sorting by category of question
- Form to submit additional challenges 


## Acknowledgements 

Thank you to Techtonica for encouraging me to build this daydream as I continued learning in the Technical Assistant role. Thank you a million times over to my mentor, [Natalia Margolis](https://github.com/Nmargolis), who has invested countless hours of her time to help me achieve my dream of being a full-stack engineer. Thanks to Scott Gilroy, a straight shooter and excellent teacher. Thanks also to [Monikka de la Zerda](https://www.linkedin.com/in/mdelazerda/) for debugging the most elusive issue I faced. I could never have done this without my spouse Zach's continuous support, kind words, and faith in me. Thanks finally to our children for not caring about this at all because I'm they're mom and they love me for that most of all. 
