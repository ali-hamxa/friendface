import React, { useState, useEffect } from "react";
import axios from "../../Api/axios";
import Post from '../../components/Post';
import UserSelector from '../../components/UserSelector';
import LikeStats from '../../components/LikeStats';
import { Container, Typography, Snackbar, Alert } from '@mui/material';

function PostsPage() {
  const [posts, setPosts] = useState([]);
  const [selectedUser, setSelectedUser] = useState("");
  const [users, setUsers] = useState([]);
  const [error, setError] = useState(null);
  const [open, setOpen] = useState(false);
  const [likeCountUpdated, setLikeCountUpdated] = useState(false);

  useEffect(() => {
    getPosts();
    getUsers();
  }, []);

  const getPosts = async () => {
    try {
      const response = await axios.get(`/posts`);
      setPosts(response.data);
    } catch (error) {
      setError("Error fetching posts");
      setOpen(true);
      console.error("Error fetching posts:", error);
    }
  };

  const getUsers = async () => {
    try {
      const response = await axios.get(`/users`);
      setUsers(response.data);
    } catch (error) {
      setError("Error fetching users");
      setOpen(true);
      console.error("Error fetching users:", error);
    }
  };

  const handleUserChange = (event) => {
    setSelectedUser(event.target.value);
  };

  const handleClose = () => {
    setOpen(false);
  };

  return (
    <Container>
      <LikeStats likeCountUpdated={likeCountUpdated} />
      <UserSelector users={users} selectedUser={selectedUser} handleUserChange={handleUserChange} />
      <Typography variant="h4" component="div" sx={{ marginBottom: '16px' }}>
        Posts
      </Typography>
      <div className="posts-container">
        {posts.map((post) => (
          <Post key={post.id} post={post} selectedUser={selectedUser} onLikeUpdate={() => setLikeCountUpdated(!likeCountUpdated)}/>
        ))}
      </div>
      <Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="error">
          {error}
        </Alert>
      </Snackbar>
    </Container>
  );
}

export default PostsPage;
