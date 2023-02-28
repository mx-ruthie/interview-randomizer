import logo from './logo.svg';
import './App.css';
import ParticipantDetails from './components/ParticipantDetails';
import CompletionRecordForm from './components/CompletionRecordForm';
import QuestionSearchForm from './components/QuestionSearchForm';
import QuestionDetailsDisplay from './components/QuestionDetailsDisplay';
import { useState } from 'react';

function App() {
   const [participant, setParticipant] = useState();
   const [question, setQuestion] = useState("Select your options from the dropdown and click 'Randomize' for a mock interview question.");
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {/* passing setParticipant the function like a prop down to the component, calling
        from the child then passes state back up to the app.js file */}
        <ParticipantDetails participant={participant} setParticipant={setParticipant}/>
        <QuestionSearchForm setQuestion={setQuestion}/>
        <QuestionDetailsDisplay />
        <CompletionRecordForm />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Day 1 of new project
        
        </a>
      </header>
    </div>
  );
}

export default App;
