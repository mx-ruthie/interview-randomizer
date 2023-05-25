const getParticipantModel = (sequelize, { DataTypes }) => {
    const Participant = sequelize.define('participant', {
      nickname: {
        type: DataTypes.STRING,
        allowNull: true,
        validate: {
          notEmpty: true,
        },
      },
      given_name: {
        type: DataTypes.STRING,
        allowNull: true,
        validate: {
          notEmpty: true,
        },
      },
      family_name: {
        type: DataTypes.STRING,
        allowNull: true,
        validate: {
          notEmpty: true,
        },
      },
      picture: {
        type: DataTypes.STRING (5000),
        allowNull: true,
        validate: {
          notEmpty: true,
        },
      },
      sub: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      email: {
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