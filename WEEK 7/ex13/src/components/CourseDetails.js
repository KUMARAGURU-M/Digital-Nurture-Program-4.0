// src/CourseDetails.js
import React from 'react';

function CourseDetails({ courses }) {
  return (
    <div className="mystyle1">
      <h1>Course Details</h1>
      <ul>
        {courses.map((course, index) =>
          course.name && course.date && (
            <div key={index}>
              <h3>{course.name}</h3>
              <h4>{course.date}</h4>
            </div>
          )
        )}
      </ul>
    </div>
  );
}

export default CourseDetails;
    