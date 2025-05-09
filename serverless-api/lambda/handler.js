const { DynamoDBClient, PutItemCommand } = require("@aws-sdk/client-dynamodb");
const { v4: uuidv4 } = require("uuid");

// Set up the DynamoDB client
const ddb = new DynamoDBClient({});

const handler = async (event) => {
  try {
    const body = JSON.parse(event.body || '{}');

    const recordId = uuidv4();
    const { type = "unspecified", data = {} } = body;

    const item = {
      id: { S: recordId },
      type: { S: type },
      data: { S: JSON.stringify(data) },
      createdAt: { S: new Date().toISOString() }
    };

    const command = new PutItemCommand({
      TableName: process.env.DDB_TABLE_NAME,
      Item: item
    });

    await ddb.send(command);

    return {
      statusCode: 200,
      body: JSON.stringify({
        message: "Record saved successfully",
        id: recordId
      })
    };
  } catch (error) {
    console.error("Error saving to DynamoDB:", error);

    return {
      statusCode: 500,
      body: JSON.stringify({ error: "Internal Server Error" })
    };
  }
};

module.exports = { handler };