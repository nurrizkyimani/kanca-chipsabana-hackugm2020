const functions = require('firebase-functions');
const admin = require('firebase-admin');
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

exports.getprojectbyid = functions.https.onRequest(async (request, response) => {
  
  // const id = request.body.id

  if (request.query.id == undefined) {
    response.send({
      error: 500
    })
  }

  const idq = request.query.id
  const snapshot = await db.collection("projects").doc(idq).get()

  response.send({
    status: 200,
    data: snapshot.data()
  })


})

//POST PROJECT





exports.addproject = functions.https.onRequest(async (req, res) => {
  
  const body = req.body
  const mapinput = {}

  //TODO: add schema validation maybe

  for (let key in body) {
    mapinput[key] = body[key]
    // console.log(key, body[key]);
  }
  
  const result = await db.collection("projects").add(mapinput)


  res.send({
    status: 200, 
    data: result
  }) 

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

exports.getuserwholikeproject = functions.https.onRequest(async (req, res) => {
   
  // if (req.query.id == undefined) {
  //   res.send({
  //     error: 500
  //   })
  // }

  // const pid = req.query.id

  // console.log(pid);

  // const pSnapshot = await db.collection("users").doc(pid).get()
  // const projectData = pSnapshot.data()

  // const result = await this.getprojectbyid(req, res)
  


   if (req.query.id == undefined) {
    response.send({
      error: 500
    })
  }

  const idq = req.query.id
  const snapshot = await db.collection("projects").doc(idq).get()

  const projectData = snapshot.data()
  
  const reso = projectData["userThatLikeId"]

  reso.forEach(user => {
    console.log(user);
  })

  

  res.send({
    status: 200,
    reso
  })




})


//GET USER ACCORDING TO THE AI


//POST LIKE TO THE USER THAT SHOWED

exports.postliketouserid = functions.https.onRequest((request, response) => {
  db.collection("projects")

})


//GET NOTIFICATION CONGRATULATIONS FOR CONNECT => GO TO CHAT

exports.getnotif = functions.https.onRequest((request, response) => {
  db.collection("projects")

})


//GET THE CHAT LIST OF THE USERS; 

exports.getchatlist = functions.https.onRequest((request, response) => {
  db.collection("projects")

})


//GET THE CHAT ROOM OF THE WITH THE USER

exports.getchat = functions.https.onRequest((request, response) => {
  db.collection("projects")

})

  // POST THE CHAT TO THE USER

  exports.postchat = functions.https.onRequest((request, response) => {
  db.collection("projects")

})





