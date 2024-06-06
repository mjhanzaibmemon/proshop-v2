// mongo.js

const { MongoClient } = require('mongodb');

// Connection URI - replace <username>, <password>, and <dbname> with your credentials
const uri = "mongodb+srv://<mjhanzaibmemon123>:<RgFuRopAl81sXfVL>@cluster0.k3trpg3.mongodb.net/<dbname>?retryWrites=true&w=majority";

// Create a new MongoClient
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

async function connectToDatabase() {
    try {
        // Connect the client to the server
        await client.connect();
        console.log("Connected successfully to MongoDB Atlas");
        return client.db();
    } catch (error) {
        console.error("Error connecting to MongoDB Atlas:", error);
        throw error;
    }
}

module.exports = {
    connectToDatabase
};
