// A generic Lambda function that receives a record and echoes it back
const handler = async (event) => {
    const body = JSON.parse(event.body || '{}');
  
    return {
      statusCode: 200,
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        message: "Record received successfully",
        record: {
          type: body.type || "unspecified",
          data: body.data || {}
        }
      })
    };
  };
  
  module.exports = { handler };
  