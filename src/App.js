import React, { useState } from "react";
import "./App.css";
import QuestionSearchForm from "./components/QuestionSearchForm";
import QuestionDetailsDisplay from "./components/QuestionDetailsDisplay";
import Profile from "./components/Profile";
import { useAuth0 } from "@auth0/auth0-react";
import Sandbox from "./components/Sandbox";
import Header from "./components/Header";
import SaveQuestion from "./components/SaveQuestion";
import ShowSaved from "./components/ShowSaved";

function App() {
  const [showSaved, setShowSaved] = useState(false);
  const [currentView, setCurrentView] = useState("questionGenerator");

  const toggleSaved = () => {
    setShowSaved(!showSaved);
    setCurrentView(currentView === "questionGenerator" ? "showSaved" : "questionGenerator");
  };

  const [question, setQuestion] = useState(
    "Select your category from the dropdown and click 'Randomize' to generate a code challenge."
  );
  const [testCases, setTestCases] = useState([]);
  const [questionId, setQuestionId] = useState();
  const [participantId, setParticipantId] = useState();
  const { isAuthenticated } = useAuth0();

  return (
    <div className="App">
      <Header />
      {!isAuthenticated && (
        <div className="logged-out">
          <h1>Mock Interview Question Randomizer</h1>
          <h2>Log in to generate a code challenge.</h2>
        </div>
      )}
      {!showSaved && isAuthenticated && <Profile />} 
      {!showSaved && isAuthenticated ? (
        <>
          <QuestionDetailsDisplay question={question} testCases={testCases} />
          <QuestionSearchForm
            setQuestion={setQuestion}
            setTestCases={setTestCases}
            setQuestionId={setQuestionId}
            setParticipantId={setParticipantId}
          />
          {participantId && <Sandbox question={question} testCases={testCases} />}
          {isAuthenticated && questionId && participantId && (
            <SaveQuestion questionId={questionId} participantId={participantId} />
          )}
          {isAuthenticated && participantId && (
            <>
              <br />
              <button onClick={toggleSaved} className="submit-button">
                {currentView === "questionGenerator" ? "View Completed Questions" : "Return to Question Generator"}
              </button>
            </>
          )}
        </>
      ) : (
        isAuthenticated && (
          <>
            <button onClick={toggleSaved} className="submit-button">
              {currentView === "questionGenerator" ? "View Completed Questions" : "Return to Question Generator"}
            </button>
            <ShowSaved participantId={participantId} className="show-saved" />
          </>
        )
      )}
    </div>
  );
}

export default App;
