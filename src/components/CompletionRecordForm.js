const CompletionRecordForm = () => {
    return(
        <div>
            <form className="completed">
                <input type="radio" name="complete-status" /> Completed Correctly
                <input type="radio"  name="complete-status"/> Did Not Complete Correctly
                <button type="submit">Update Participant Record</button>
            </form>
        </div>
    )
}

export default CompletionRecordForm;