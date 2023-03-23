const getQuestionModel = (sequelize, { DataTypes }) => {
    const Question = sequelize.define('question', {
      text: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
    });
  
    return Question;
  };
  
  export default getQuestionModel;