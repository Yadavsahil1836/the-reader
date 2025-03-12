Flutter API Integration Project
This Flutter application demonstrates fetching and displaying data from an external API, along with implementing responsive UI practices, asynchronous operations, and graceful error handling.

Project Overview
The application fetches a list of posts from a public API (jsonplaceholder.typicode.com) and displays them in a visually appealing, scrollable ListView with smooth animations and an intuitive UI.

Features Implemented
API Integration: Using the http package to retrieve data asynchronously from JSONPlaceholder API.
Asynchronous Handling: Efficiently manages API requests with proper use of Futures and async/await.
Loading Indicator: A shimmer loading effect is implemented while data is fetched to enhance user experience.
Error Handling: Errors in fetching data are gracefully managed, providing clear user feedback.
Animated UI: Smooth entry animations for list items using TweenAnimationBuilder.
Navigation & Splash Screen: An animated splash screen transitions seamlessly to the main content using the lottie animation package.
Floating Action Button: Convenient "Back to Top" button appears based on user scrolling behavior.

