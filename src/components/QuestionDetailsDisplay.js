const QuestionDetailsDisplay = (props) => {
    return(
        <div>
            {/* receiving the updated state from the parent App.js -
            data grabbed in QuestionSearchForm component */}
            {props.question}
            {props.testCases};
        </div>
    )
}

export default QuestionDetailsDisplay;