# Firebase on Flutter mobile and web

Simple Tutorial for Firebase Authentication (login) and Firestore on Flutter mobile and web

# The Problem
Since Flutter web came out from beta this year, I've been wanting to make a full production app that works smoothly for both mobile, and web. This obviously meant integrating Firebase Authentication (auth), Firebase Cloud Firestore, etc on my web and mobile app.


Doing so on mobile and web are no problems at all since dedicated packages are available to use Firebase Authentication (auth) and Firebase Cloud Firestore on mobile and web separately.
Firebase libraries for mobile:
firebase_core
firebase_auth
could_firestore
Firebase libraries for web:
firebase
The real problems arise when you try to add both of these in the single codebase.

# The Solution

Have a look at the Medium article I wrote here to get to know how to get Firebase web and mobile working in one codebase.
