const ParticipantDetails = (props) => {
    return(
        <>
        <div>Hello, {props.particpant}!</div>
        <div>Hi! This is the ParticipantDetails component in action.</div>
        <form className="participant-email">
            <input type="text" placeholder="Please enter particpant email"/>
            <input type="Submit"/>
        </form>
        </>
    )
}

export default ParticipantDetails;