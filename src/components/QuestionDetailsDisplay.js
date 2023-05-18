/**
 * Displays the text of a question and maps out the associated list of test cases
 */
const QuestionDetailsDisplay = (props) => {
  return (
    <div className="question">
      {/* receiving the updated state from the parent App.js -
            data grabbed in QuestionSearchForm component */}
      <div classname="question-element">
        <h2>Question</h2>
        {props.question}
      </div>
      <div classname="question-element">
        <h2>Test Cases</h2>
        <ul>
          {props.testCases.map((testCase, key) => (
            <li key={key}>{testCase}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default QuestionDetailsDisplay;
