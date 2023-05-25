//import logo from './logo.svg';
import "./App.css";
//import ParticipantDetails from './components/ParticipantDetails';
import QuestionSearchForm from "./components/QuestionSearchForm";
import QuestionDetailsDisplay from "./components/QuestionDetailsDisplay";
import { useState } from "react";
import Profile from "./components/Profile";
import { useAuth0 } from "@auth0/auth0-react";
import Sandbox from "./components/Sandbox";
import Header from "./components/Header";

//import { Auth0Provider } from '@auth0/auth0-react';
function App() {
  //const {user} = useAuth0();
  // const [participant, setParticipant] = useState();
  const [question, setQuestion] = useState(
    "Select your category from the dropdown and click 'Randomize' to generate a code challenge."
  );
  const [testCases, setTestCases] = useState([]);

  const { isAuthenticated } = useAuth0();
  return (
    <div className="App">
      <Header />
      {isAuthenticated ? null : (
        <div className="logged-out">
          <h2>Techtonica Mock Interview Question Randomizer </h2>
          <h3>Log in to generate a code challenge.</h3>
        </div>
      )}
      <Profile />
      <QuestionDetailsDisplay question={question} testCases={testCases} />
      <QuestionSearchForm
        setQuestion={setQuestion}
        setTestCases={setTestCases}
      />
      {!isAuthenticated ? null : (
        <Sandbox question={question} testCases={testCases} />
      )}
    </div>
  );
}

export default App;
