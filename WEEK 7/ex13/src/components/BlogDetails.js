// src/BlogDetails.js
import React from 'react';

function BlogDetails({ blogs }) {
  const blogContent = blogs.length > 0 ? (
    blogs.map((blog, index) => (
      <div key={index}>
        <h3>{blog.title}</h3>
        <strong>{blog.author}</strong>
        <p>{blog.content}</p>
      </div>
    ))
  ) : (
    <p>No blogs available.</p>
  );

  return (
    <div className="v1">
      <h1>Blog Details</h1>
      {blogContent}
    </div>
  );
}

export default BlogDetails;
