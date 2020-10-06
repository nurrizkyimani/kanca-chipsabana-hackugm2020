const functions = require('firebase-functions');
const admin = require('firebase-admin');
const createHttpError = require('http-errors');
const Joi = require('joi')

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
exports.postuser = functions.https.onRequest( async (req, res) => {
  try {
    const body = req.body
    const mapinput = {}
    if (body == undefined) {
      createHttpError(400, 'The body doesnt exist')
    }

    for (let key in body) {
      mapinput[key] = body[key]
      // console.log(key, body[key]);
    }
    
    const result = await db.collection("users").add(mapinput)

    res.send({
      
      data: result
    }) 
  } catch (error) {
    console.error(error);
  }
  


})


//GET USER PROFILE PER UID

exports.getuserperid = functions.https.onRequest(async (request, response) => {

  try {
      if (request.query.id == undefined) {
        throw createHttpError.BadRequest();
      }

    const idq = request.query.id
    const snapshot = await db.collection("users").doc(idq).get()

    response.send({
      success: true,
      data: snapshot.data()
    })
  } catch (error) {
    console.error(error);
  }

})

// //GET USER CHAT LIST  DI FLUTTERNYA AJA; 
// exports.getchatlist = functions.https.onRequest((request, response) => {
  
// })


//GET USER CHAT WITH OTHER
// exports.chatbyid = functions.https.onRequest((request, response) => {
//   console.log('todo');
// })



//POST USER CHAT WITH OTHER
// exports.chatbyid = functions.https.onRequest((request, response) => {
//   console.log('todo');
// })


//FROM THE PERSPECRIVE OF PROJECT LOOKER


// REST ALL ABOUT THE PROJECTS

//GET PROJECT BY THE TAGS OF THE PROJECTS; 

// GET USER BY THE TAG IN USER; FOR MACHINE LEARNING; 
exports.getprojectsbythetag = functions.https.onRequest(async (req, res) => {
  try {
      const tag = req.body.tag
      if (tag == undefined) {
        createHttpError.BadRequest()
      }
  
    const allTags = []
    const groupRef = db.collection('projects')
    groupRef.where('tags', 'array-contains', tag)
      .onSnapshot((querySnapshot) => {
        const allTagsIn  = []
        querySnapshot.forEach((doc) => {
          const data = doc.data()
          data.id = doc.id
          allTagsIn.push(data)
        })
        allTags = allTagsIn
      })
    
    res.send({
      
      data : allTags
    })
  } catch (error) {
    console.error(error);
  }

})

//GET  ALL PROJECTS
exports.getprojects = functions.https.onRequest( async (request, response) => {

  try {
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
      
      data: result
    })
  } catch (error) {
    console.error(error)
  }
})

//GET PROJECT BY ID
exports.getprojectbyid = functions.https.onRequest(async (request, response) => {

  try {
    if (request.query.id == undefined) {
    throw createHttpError.BadRequest()
    }

    const idq = request.query.id
    const snapshot = await db.collection("projects").doc(idq).get()

    response.send({
      
      data: snapshot.data()
    })
  } catch (error) {
    console.error(error);
  }

})

//POST PROJECT
exports.addproject = functions.https.onRequest(async (req, res) => {
  
  const body = req.body
  const mapinput = {}


  
  try {

    for (let key in body) {
      mapinput[key] = body[key]
    }
    const result = await db.collection("projects").add(mapinput)

    res.send({
     
    data: result
  }) 
  } catch (error) {
    console.error(error);
  }
 

 

})


//FROM PROJECT OWNER PERSPECTIVE

//GET ALL USERS; FOR CARD STACK;  
exports.getusers = functions.https.onRequest(async (request, response) => {

  try {
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

  } catch (error) {
    console.error(error);
  }

})

// GET USER BY THE TAG IN USER; FOR MACHINE LEARNING; 
exports.getuserbysuggestedtag = functions.https.onRequest(async (req, res) => {
  try {
    const tag = req.body.tag

    if (tag == undefined) {
      throw createHttpError.BadRequest()
      
    }
    const allTags = []
    const groupRef = db.collection('users')
    groupRef.where('tags', 'array-contains', tag)
      .onSnapshot((querySnapshot) => {
        const allTagsIn  = []
        querySnapshot.forEach((doc) => {
          const data = doc.data()
          data.id = doc.id
          allTagsIn.push(data)
        })
        allTags = allTagsIn
      })
    
    res.send({
      data : allTags
  })
  } catch (error) {
    console.error(error);
  }
  
})

  // for (let key in body) {
  //   mapinput[key] = body[key]
  //   // console.log(key, body[key]);
  // }
  
  // const result = await db.collection("users").add(mapinput)

//GEt USER that like the projects
exports.getuserwholikeproject = functions.https.onRequest(async (req, res) => {
  
  if (req.query.id == undefined) {
    throw createHttpError.BadRequest()
  }

  try {
    const idq = req.query.id
    const snapshot = await db.collection("projects").doc(idq).get()
    const projectData = snapshot.data()

    const userlike = projectData["userThatLikeId"]


    res.send({
      
      userlike
    })
  } catch (error) {
    console.error(error);
  }

  

})


//GET USER ACCORDING TO THE AI


//POST LIKE TO THE USER THAT SHOWED
// exports.postliketouserid = functions.https.onRequest((request, response) => {
  

//   response.send("comming soon")



// })


//dari flutter aja;

//POST LIKE TO THE USER THAT SHOWED
//GET NOTIFICATION CONGRATULATIONS FOR CONNECT => GO TO CHAT

// exports.getnotif = functions.https.onRequest((request, response) => {
//   response.send("comming soon")

//   //implement firebase

// })


//GET THE CHAT LIST OF THE USERS; 

exports.fecthgroupbyuserid = functions.https.onRequest((req, res) => {

  try {
      if (req.query.uid == undefined) { 
        res.send("no")
      }
    
      const uid = req.query.uid

      console.log(uid);

      res.send({
      uid
    })

    // const groupRef = db.collection('groups')

    // const resgroup = null

    // groupRef.where('members', 'array-contains', uid)
    //   .onSnapshot((querySnapshot) => {    
    //   const allGroups = []
    //     querySnapshot.forEach((doc) => {
    //       const data = doc.data()
    //       data.id = doc.id
    //       if (data.recentMessage) allGroups.push(data)
    //     })
        
    //     resgroup = allGroups

    //   })
    
    // res.send({
    //   data: resgroup
    // })
  } catch (error) {
    console.error(error);
  }
})

//https://levelup.gitconnected.com/structure-firestore-firebase-for-scalable-chat-app-939c7a6cd0f5


//GET THE CHAT ROOM OF THE WITH THE USER

// exports.fetchmessagebyid = functions.https.onRequest((request, response) => {
  

// })


  // POST THE CHAT TO THE USER
exports.savemessage = functions.https.onRequest( (request, response) => {



  const uid = req.query.id
  const timestamp = new Date.now()
  const currentGroupId = 0
  const messageText = req.body

  if (messageText.trim()) {
    const message = {
      messageText,
      sentAt : timestamp,
      sentBy: uid ,
    }

    db.collection('messages')
      .doc(currentGroupId)
      .collection('message')
      .add(message)
      .then(function (docRef) {
        res.send({
          message
        })
      })
      .catch(function (error) {
        console.error(error);
        res.send({error})
      })

  }

})





