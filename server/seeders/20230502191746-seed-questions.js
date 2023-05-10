'use strict';
import questionData from '../questions.json';
import dotenv from 'dotenv';
dotenv.config();

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('Question', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
//const map1 = array1.map(x => x * 2);

    const fields = questionData.questions.map((question) => {
      console.log('question', question);
      //question = {text: "i am a question", testCases: ["case1", "case2"]}

      // return {...question};
      return { ...question, testCases: JSON.stringify(question.testCases) };
    });

   
    return queryInterface.bulkInsert('questions', fields, {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
