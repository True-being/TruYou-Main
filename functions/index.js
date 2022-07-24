const functions = require('firebase-functions')
const admin = require('firebase-admin');

const Firestore = require('@google-cloud/firestore');
const firestore = new Firestore();

admin.initializeApp();

const db = admin.firestore();

exports.doesEmailAlreadyExist = functions.https.onCall(async(data, _context) => {
    const email = data.email;

    let querySnapshot = await db.collection('users').where('email', '==', email).get();

    return (querySnapshot.docs.length >= 1);
});

exports.doesAddressAlreadyExist = functions.https.onCall(async(data, _context) => {
    const address = data.algoWalletAddress;

    let querySnapshot = await db.collection('users').where('algoWalletAddress', '==', address).get();

    return (querySnapshot.docs.length >= 1);
});

exports.confirmedMatch = functions.https.onCall(async(data, _context) => {

    const userUID = data.userUID;
    const swipedUserUID = data.swipedUserUID;

    let uidQuery = db.collection('users').doc(swipedUserUID).collection('swipes').where('uid', '==', userUID).where('type', '==', 'match');

    uidQuery.get().then(function(querySnapshot) {
        querySnapshot.forEach(function(doc) {
            doc.ref.delete();
        });
    });

    await db.collection('users').doc(userUID).collection('swipes').add({
        uid: swipedUserUID,
        'type': 'confirmedMatch'
    });

    await db.collection('users').doc(swipedUserUID).collection('swipes').add({
        uid: userUID,
        'type': 'confirmedMatch'
    });
});

exports.confirmedMiss = functions.https.onCall(async(data, _context) => {
    const userUID = data.userUID;
    const swipedUserUID = data.swipedUserUID;

    let uidQuery = db.collection('users').doc(swipedUserUID).collection('swipes').where('uid', '==', userUID).where('type', '==', 'miss');

    uidQuery.get().then(function(querySnapshot) {
        querySnapshot.forEach(function(doc) {
            doc.ref.delete();
        });
    });

    await db.collection('users').doc(userUID).collection('swipes').add({
        uid: swipedUserUID,
        'type': 'confirmedMiss'
    });

    await db.collection('users').doc(swipedUserUID).collection('swipes').add({
        uid: userUID,
        'type': 'confirmedMiss'
    });
});

exports.unmatch = functions.https.onCall(async(data, _context) => {
    const userUID = data.userUID;
    const matchedUserUID = data.matchedUserUID;

    let userUnmatchQuery = await db.collection('users').doc(userUID).collection('swipes').where('uid', '==', matchedUserUID).where('type', '==', 'confirmedMatch').limit(1).get();
    let matchedUserUnmatchQuery = await db.collection('users').doc(matchedUserUID).collection('swipes').where('uid', '==', userUID).where('type', '==', 'confirmedMatch').limit(1).get();

    userUnmatchQuery.forEach(async function(doc) {
        await db.collection('users').doc(userUID).collection('swipes').doc("" + doc.id).update({ 'type': 'confirmedMiss' });
    });

    matchedUserUnmatchQuery.forEach(async function(doc) {
        await db.collection('users').doc(matchedUserUID).collection('swipes').doc("" + doc.id).update({ 'type': 'confirmedMiss' });
    })

});