import fakeData from '../fixtures/questions.json';
// Worked with Cristina, opted to import JSON directly within the file for now

const QuestionSearchForm = (props) => {
// The fetch wasn't working correctly, and the response was 
// delivering a localhost URL instead of the data.
    //   async function fetchFakeData() {
//     // console.log("inside the fetch data");
//     const res = await fetch('../fixtures/questions.json');
//     console.log("this is line 5", json);
//     const json = await res.json();
//     console.log("this is line 6", json);
//     //return json;
//   }


  const handleSubmit = (event) => {
    event.preventDefault();
    console.log("inside the handleSubmit"
    )
    console.log(fakeData)
    //fetchFakeData();
     props.setQuestion(fakeData.questions[0].text);
    //  need to map setTestCases one after the other 
     props.setTestCases(fakeData.questions[0].testCases)
    };

  return (
    <>
      <form onSubmit={handleSubmit}>
        <label>
          <select>
            <option value="strings">Strings</option>
            <option value="Arrays">Arrays</option>
            <option value="booleans">Booleans</option>
            <option value="integers">Integers</option>
            <option value="objects">Objects</option>
          </select>
        </label>
        {/* edited the submit to be a button instead of an input type */}
        <button type="submit" value="Randomize">
        Randomize
      </button>
      </form>
      
    </>
  );
};

export default QuestionSearchForm;
