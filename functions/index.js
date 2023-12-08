const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();


exports.sendNotificationOnEmailChanged = functions.firestore.document('users/{phoneNo}').onUpdate(async(snap,context)=>{
    const oldData = snap.before.data();
    const newData = snap.after.data();
    if(oldData.phoneNo != newData.phoneNo){
      var payload = {
        Notification:{
          title:"your phone number will be change",
          body: oldData.phoneNo +'replaced to ' +newData.phoneNo,
          sound: 'beep',
          channed_id:'HUNGRY',
          androiod_channel_id:'HUNGRY',
          priority: 'high',

        }

        
      }
      try{
        const response =await admin.messaging().sendToDevice(newData.FCMtoken,payload);

      }catch(e){
       console.log(e);
      }
    }
})