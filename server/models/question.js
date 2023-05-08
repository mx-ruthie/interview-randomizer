const getQuestionModel = (sequelize, { DataTypes }) => {
    const Question = sequelize.define('question', {
      category: {
        type: DataTypes.JSON,
        allowNull: true,
      },
      text: {
        type: DataTypes.STRING,
        unique: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      // added testCases according to convention in camelCase plus updated the index.js file to update the .sync function
      // to alter table
      testCases: {
        type: DataTypes.JSON,
        allowNull: true,
      },
    });
  
    return Question;
  };
  
  export default getQuestionModel;