const functions = require('firebase-functions')
const admin = require('firebase-admin');

const Firestore = require('@google-cloud/firestore');
const firestore = new Firestore();

admin.initializeApp();

const db = admin.firestore();

exports.doesEmailAlreadyExist = functions.https.onCall(async(data, context) => {
    const email = data.email;

    var querySnapshot = await db.collection('users').where('email', '==', email).get();

    return (querySnapshot.docs.length >= 1);
});

exports.doesAddressAlreadyExist = functions.https.onCall(async(data, context) => {
    const address = data.algoWalletAddress;

    var querySnapshot = await db.collection('users').where('algoWalletAddress', '==', address).get();

    return (querySnapshot.docs.length >= 1);
});