import logo from './logo.svg';
import './App.css';
import ParticipantDetails from './components/ParticipantDetails';
import CompletionRecordForm from './components/CompletionRecordForm';
import QuestionSearchForm from './components/QuestionSearchForm';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <ParticipantDetails />
        <CompletionRecordForm />
        <QuestionSearchForm />

        
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
