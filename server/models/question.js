const getQuestionModel = (sequelize, { DataTypes }) => {
    const Question = sequelize.define('question', {
      //npx sequelize-cli db:seed:all (this is failing and the error is related to the createdAt, etc.) 
      //I tried to retroactively add timestamps false, etc, but since the tables already exist I need to alter and drop these columns
      //instead of trying to trick sequelize into pretending they were never there by adding them after and hoping
      //alter table from server.js did the trick -- it didn't
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
      // added testCases according to convention in camelCase plus updated the index.js file to update the .sync function
      // to alter table
      testCases: {
        type: DataTypes.JSON,
        allowNull: true,
      }, 
  

    }, {
      // Exclude timestamps from the table
      timestamps: false
    });
  
    return Question;
  };
  
  export default getQuestionModel;