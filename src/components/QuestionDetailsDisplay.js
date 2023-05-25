/**
 * Displays the text of a question and maps out the associated list of test cases
 */
const QuestionDetailsDisplay = (props) => {
    return(
        <div className="question">
            {props.question}
            <ul>{props.testCases.map((testCase, key)=>(<li key={key}>{testCase}</li>))}</ul>
        </div>
    )
}

export default QuestionDetailsDisplay;