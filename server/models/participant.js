const getParticipantModel = (sequelize, { DataTypes }) => {
    const Participant = sequelize.define('participant', {
      username: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
    });
  
    return Participant;
  };
  
  export default getParticipantModel;