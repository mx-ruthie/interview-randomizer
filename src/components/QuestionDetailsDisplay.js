/**
 * Displays the text of a question and maps out the associated list of test cases
 */
const QuestionDetailsDisplay = (props) => {
    return(
        <div>
            {/* receiving the updated state from the parent App.js -
            data grabbed in QuestionSearchForm component */}
            {props.question}
            <ul>{props.testCases.map((testCase, key)=>(<li key={key}>{testCase}</li>))}</ul>
        </div>
    )
}

export default QuestionDetailsDisplay;