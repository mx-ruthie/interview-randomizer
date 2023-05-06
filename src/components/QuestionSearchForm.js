//import fakeData from '../fixtures/questions.json';
import { useState } from "react";

const QuestionSearchForm = (props) => {
  const [questionText, setQuestionText] = useState(
    "The question text will generate here."
  );
  const [testcases, setTestcases] = useState([
    "Testcase 1",
    "Testcase 2",
    "Testcase 3",
  ]);

  // moved these props outside of the handleSubmit so that they would generate before submitting 
  props.setQuestion(questionText);
  props.setTestCases(testcases);

  async function fetchQuestionData() {
    const response = await fetch("/questions");
    const questionJSON = await response.json();
    //setting part of the results to state so that the results could be accessed outside of the fetch function
    setQuestionText(questionJSON[0].text);
    setTestcases(questionJSON[0].testCases);
    return questionJSON;
  }
  console.log(questionText);
  console.log(testcases);

  const handleSubmit = (event) => {
    event.preventDefault();
    fetchQuestionData();
  };

  return (
    <>
      <form onSubmit={handleSubmit}>
        {/* edited the submit to be a button instead of an input type */}
        <button type="submit" value="Click for Question">
          Click for Question
        </button>
      </form>
    </>
  );
};

export default QuestionSearchForm;
