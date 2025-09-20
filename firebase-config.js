// Firebase configuration
const firebaseConfig = {
    apiKey: "YOUR_API_KEY",
    authDomain: "your-project.firebaseapp.com",
    projectId: "your-project",
    storageBucket: "your-project.appspot.com",
    messagingSenderId: "YOUR_SENDER_ID",
    appId: "YOUR_APP_ID"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
const storage = firebase.storage();
const db = firebase.firestore();

// Utility functions for file upload
async function uploadFile(file, path) {
    const storageRef = storage.ref();
    const fileRef = storageRef.child(path);
    await fileRef.put(file);
    return await fileRef.getDownloadURL();
}

// Functions for handling research papers
const researchCollection = db.collection('research');

async function addResearchPaper(data) {
    return await researchCollection.add({
        title: data.title,
        description: data.description,
        author: data.author,
        year: data.year,
        category: data.category,
        fileUrl: data.fileUrl,
        uploadDate: firebase.firestore.FieldValue.serverTimestamp()
    });
}

async function getResearchPapers() {
    const snapshot = await researchCollection.orderBy('uploadDate', 'desc').get();
    return snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data()
    }));
}

// Functions for handling presentations
const presentationsCollection = db.collection('presentations');

async function addPresentation(data) {
    return await presentationsCollection.add({
        title: data.title,
        description: data.description,
        author: data.author,
        subject: data.subject,
        type: data.type,
        fileUrl: data.fileUrl,
        thumbnailUrl: data.thumbnailUrl,
        uploadDate: firebase.firestore.FieldValue.serverTimestamp()
    });
}

async function getPresentations() {
    const snapshot = await presentationsCollection.orderBy('uploadDate', 'desc').get();
    return snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data()
    }));
}

// Functions for handling library resources
const libraryCollection = db.collection('library');

async function addLibraryResource(data) {
    return await libraryCollection.add({
        title: data.title,
        description: data.description,
        category: data.category,
        type: data.type,
        fileUrl: data.fileUrl,
        uploadDate: firebase.firestore.FieldValue.serverTimestamp()
    });
}

async function getLibraryResources() {
    const snapshot = await libraryCollection.orderBy('uploadDate', 'desc').get();
    return snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data()
    }));
}

// Export the functions
export {
    uploadFile,
    addResearchPaper,
    getResearchPapers,
    addPresentation,
    getPresentations,
    addLibraryResource,
    getLibraryResources
};