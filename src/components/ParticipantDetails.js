const ParticipantDetails = (props) => {

  const handleSubmit = (e) => {
    e.preventDefault();
    // e.target[0] is the first input of the form, which is why it is 0 indexed
    props.setParticipant(e.target[0].value);
  };
  return (
    <>
      <div>Hello, {props.participant}!</div>
      <div> ParticipantDetails component</div>
      <form className="participant-email" onSubmit={handleSubmit}>
        {/* on following line "participant-email" in all lower case with hyphen--will use this
            to call the data later, so having the formatting with no spaces, etc is needed */}
        <input
          type="text"
          placeholder="Please enter particpant email"
          name="participant-email"
        />
        <input type="Submit" />
      </form>
    </>
  );
};

export default ParticipantDetails;
