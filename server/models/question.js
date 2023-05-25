const getQuestionModel = (sequelize, { DataTypes }) => {
    const Question = sequelize.define('question', {
      //npx sequelize-cli db:seed:all (this is failing and the error is related to the createdAt, etc.) 
      //I tried to retroactively add timestamps false, etc, but since the tables already exist I need to alter and drop these columns
      //instead of trying to trick sequelize into pretending they were never there by adding them after and hoping
      //alter table from server.js did the trick, I deleted the tables and re-initialized them so the seed would work
      category: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      text: {
        type: DataTypes.TEXT,
        unique: true,
        allowNull: false,
        validate: {
          notEmpty: true,
        },
      },
      testCases: {
        type: DataTypes.JSON,
        allowNull: true,
      }, 
  

    }, {
      timestamps: false
    });
  
    return Question;
  };
  
  export default getQuestionModel;