//import fakeData from '../fixtures/questions.json';
import { useState } from "react";




const QuestionSearchForm = (props) => {
 
const [questionText, setQuestionText] = useState("The question text will generate here.")
const [testcases, setTestcases] = useState(["Testcase 1", "Testcase 2", "Testcase 3"]);

props.setQuestion(questionText);
    props.setTestCases(testcases);

async function fetchQuestionData () {
  const response = await fetch("http://localhost:8088/questions");
  const questionJSON = await response.json();
  setQuestionText(questionJSON[0].text);
  
  setTestcases(questionJSON[0].testCases);
  return questionJSON;
}
console.log(questionText);
console.log(testcases);

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log("inside the handleSubmit")
   fetchQuestionData();
   
    
    };

  return (
    <>
      <form onSubmit={handleSubmit}>
        {/* <label>
          <select>
            <option value="strings">Strings</option>
            <option value="Arrays">Arrays</option>
            <option value="booleans">Booleans</option>
            <option value="integers">Integers</option>
            <option value="objects">Objects</option>
          </select>
        </label> */}
        {/* edited the submit to be a button instead of an input type */}
        <button type="submit" value="Randomize">
        Randomize
      </button>
      </form>
      
    </>
  );
};

export default QuestionSearchForm;
