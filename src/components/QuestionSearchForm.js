import { useState, useEffect } from "react";
import { useAuth0 } from "@auth0/auth0-react";

const QuestionSearchForm = (props) => {
  
  const { user, isAuthenticated } = useAuth0();

  const [questionText, setQuestionText] = useState(
    "Please log in to generate questions."
  );
  const [testcases, setTestcases] = useState([
    "",
    "",
    "",
  ]);

  // moved these props outside of the handleSubmit so that they would generate before submitting 
  useEffect(() => {
  props.setQuestion(questionText);
  props.setTestCases(testcases);
  console.log(questionText);
  console.log(testcases);
}, [props, questionText, testcases])


  async function fetchQuestionData() {
    const response = await fetch("/questions");
    const questionJSON = await response.json();
    //setting part of the results to state so that the results could be accessed outside of the fetch function
    const randomIndex = Math.floor(Math.random() * questionJSON.length);
    setQuestionText(questionJSON[randomIndex].text);
    setTestcases(questionJSON[randomIndex].testCases);
    return questionJSON;
  }
  

  const handleSubmit = (event) => {
    event.preventDefault();
    fetchQuestionData();
  };

  const handleNext = async (event) => {
    event.preventDefault(); 
    fetch("/api/user", {
      method: "POST",
      headers: {
        "content-type": "application/json",
        // Authorization: `Bearer ${accessToken}`
      },
      body: JSON.stringify(user)
    })
    .then(response => response.json())
    .then(data => console.log(data)) 
    .catch(error => console.log(error));
  }
  return (
    <>
      <form onSubmit={handleSubmit}>
        <button className="submit-button" type="submit" value="Click for Question">
          Click for Question
        </button>
        {!isAuthenticated ? null : <button onClick={handleNext} className="submit-button">
          Mark Question as Complete
        </button>} 
                
      </form>
    </>
  );
};

export default QuestionSearchForm;
