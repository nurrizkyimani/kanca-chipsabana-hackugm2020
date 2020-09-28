const functions = require('firebase-functions');
const admin = require('firebase-admin')
admin.initializeApp()


const db = admin.firestore();

//TESTING

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


// REST ALL ABOUT THE USERS; 


//POST THE USER PROFILE

//GET USER PROFILE PER UID

exports.getuser = functions.https.onRequest((request, response) => {
  console.log('todo');
})

//GET USER CHAT LIST 

exports.getchatlist = functions.https.onRequest((request, response) => {
  console.log('todo');
})


//GET USER CHAT WITH OTHER

exports.chatbyid = functions.https.onRequest((request, response) => {
  console.log('todo');
})



//POST USER CHAT WITH OTHER

exports.chatbyid = functions.https.onRequest((request, response) => {
  console.log('todo');
})


//FROM THE PERSPECRIVE OF PROJECT LOOKER


//




// REST ALL ABOUT THE PROJECTS

//GET  ALL PROJECTS

exports.getprojects = functions.https.onRequest( async (request, response) => {
  const snapshot = await db.collection('users').get()
  const result = []
  snapshot.forEach(doc => {
    console.log(doc.id);
    result.push({
      id: doc.id,
      data: doc.data()
    })
  })


  response.send({
    status: 200,
    data: result
  })
})

//GET PROJECT BY ID

//POST PROJECT

exports.addProject = functions.https.onRequest((request, response) => {
  db.collection("projects")

})


//PUT PROJECT

//DELETE PROJECT



//FROM PROJECT OWNER PERSPECTIVE

//GET ALL USERS;
exports.getusers = functions.https.onRequest(async (request, response) => {
  const snapshot = await db.collection('users').get()
  const result = []
  snapshot.forEach(doc => {
    console.log(doc.id);
    result.push({
      id: doc.id,
      data: doc.data()
    })
  })

  response.send({
    status: 200,
    data: result
  })
  
})
  



//GEt USER that like the projects


//GET USER ACCORDING TO THE AI


//POST LIKE TO THE USER THAT SHOWED


//GET NOTIFICATION CONGRATULATIONS FOR CONNECT => GO TO CHAT


//GET THE CHAT LIST OF THE USERS; 


//GET THE CHAT ROOM OF THE WITH THE USER

  // POST THE CHAT TO THE USER





