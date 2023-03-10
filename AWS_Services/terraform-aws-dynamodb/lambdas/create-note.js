const AWS = require("aws-sdk");
const NOTES_TABLE = process.env.NOTES_TABLE;

const documentClient = new AWS.DynamoDB.DocumentClient();

module.exports.handler = async (event, context) => {
  // create a new object

  const body = event.body; const newNote = {
    ...body,
    noteId: Date.now(),
    expiryPeriod: Date.now(),
  };

  await documentClient
    .put({
      TableName: NOTES_TABLE,
      Item: newNote,
    })
    .promise();

  // return the created object

  return { statusCode: 200, body: JSON.stringify(newNote),
  };
};
