import { useState, useEffect } from "react";
import { useAuth0 } from "@auth0/auth0-react";

const QuestionSearchForm = (props) => {
  
  const { user, isAuthenticated } = useAuth0();

  const [questionText, setQuestionText] = useState(
    ""
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
    //filter questionJSON to only include questions that are not complete
    //fetch list of questions that the user has completed (another api route)
    //then use filterarry method to filter out the questions in the questionJSOn where the IDs are not in the array of questions that the user has completed
    //then create random index based on the filtered aray 
    //filteredarray = questionjson.filter, etc.
    const randomIndex = Math.floor(Math.random() * questionJSON.length);
    setQuestionText(questionJSON[randomIndex].text);
    setTestcases(questionJSON[randomIndex].testCases);
    props.setQuestionId(questionJSON[randomIndex].id);
    return questionJSON;
  }
  

  const handleSubmit = (event) => {
    event.preventDefault();
    fetchQuestionData();
    handleNext(event);
  };

  const handleNext = async (event) => {
    event.preventDefault(); 
    await fetch("/api/user", {
      method: "POST",
      headers: {
        "content-type": "application/json",
      },
      body: JSON.stringify(user)
    })
    .then(response => response.json())
    .then(data => {
      console.log("i am data", data);
      //todo: verify this with new user that doesn't already exist
      props.setParticipantId(data[0].id);
    }) 
    .catch(error => console.log(error));
  }
  return (
    <>
      <form onSubmit={handleSubmit}>
        {!isAuthenticated ? null : <button className="submit-button" type="submit" value="Click for Question">
          Step 1: Generate Question
        </button>}
        
                
      </form>
    </>
  );
};

export default QuestionSearchForm;
