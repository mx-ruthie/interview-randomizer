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
   const fields = questionData;
    return queryInterface.bulkInsert('Question', fields, {});
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
