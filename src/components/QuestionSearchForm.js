async function fetchFakeData() {
  const res = await fetch("../fixtures/questions.json");
  const json = await res.json();
  console.log(json.questions[0]);
  return json.questions[0];
}

const QuestionSearchForm = (props) => {
  
 const setQuestion = props.setQuestion;
    return (
    <>
      <form>
        <label>
          <select>
            <option value="grapefruit">Grapefruit</option>
            <option value="lime">Lime</option>
            <option selected value="coconut">
              Coconut
            </option>
            <option value="mango">Mango</option>
          </select>
        </label>
      </form>
      <input type="submit" value="Submit" />
      <div>QUESTION TEXT AND TC</div>
    </>
  );
};

export default QuestionSearchForm;
