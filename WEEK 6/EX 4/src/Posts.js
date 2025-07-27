import React, { Component } from 'react';
import Post from './Post';

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      error: null
    };
  }

  loadPosts() {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(response => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then(data => {
        const loadedPosts = data.map(p => new Post(p.userId, p.id, p.title, p.body));
        this.setState({ posts: loadedPosts });
      })
      .catch(error => {
        this.setState({ error });
      });
  }

  componentDidMount() {
    this.loadPosts();
  }

  componentDidCatch(error, info) {
    alert("An error occurred in the component: " + error);
  }

  render() {
    const { posts, error } = this.state;

    if (error) {
      return <div>Error occurred: {error.message}</div>;
    }

    return (
  <div>
    <h1>Blog Posts</h1>
    {posts.map(post => (
      <div key={post.id} className="post-container">
        <h3>{post.title}</h3>
        <p>{post.body}</p>
      </div>
    ))}
  </div>
);

  }
}

export default Posts;
