//import logo from './logo.svg';
import './App.css';
//import ParticipantDetails from './components/ParticipantDetails';
//import InterviewerForm from './components/InterviewerForm';
import QuestionSearchForm from './components/QuestionSearchForm';
import QuestionDetailsDisplay from './components/QuestionDetailsDisplay';
import { useState } from 'react';
import LoginButton from './components/LoginButton';
import LogoutButton from './components/LogoutButton';
import Profile from './components/Profile';
//import { useAuth0 } from  "@auth0/auth0-react";

//import { Auth0Provider } from '@auth0/auth0-react';
function App() {
  //const {user} = useAuth0();
  // const [participant, setParticipant] = useState();
   const [question, setQuestion] = useState("Select your category from the dropdown and click 'Randomize' to generate a code challenge.");
   const [testCases, setTestCases] = useState([]);

  return (
    <div className="App">
      <header className="App-header">
        <LoginButton />
        <LogoutButton />
        <Profile />
        <h2>Welcome to the Techtonica Mock Interview Question Randomizer</h2>
        {/* passing setParticipant the function like a prop down to the component, calling
        from the child then passes state back up to the app.js file */}
        {/* <ParticipantDetails participant={participant} setParticipant={setParticipant}/>
        */}
        {/* passing down state in the QuestionSearch and QuestionDetails components:
        setQuestion is a callback function that updates the question state defined
        in this component - the question state that gets updates then gets passed 
        down to the QuestionDetails child */}
        {/* <InterviewerForm /> */}
    
      </header>
      <QuestionDetailsDisplay question={question} testCases={testCases}/> 
      <QuestionSearchForm setQuestion={setQuestion} setTestCases={setTestCases}/> 
     
    </div>
  );
}

export default App;
