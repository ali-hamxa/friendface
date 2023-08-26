import React, { useState } from "react";
import axios from '../Api/axios';
import { AiOutlineHeart, AiFillHeart } from "react-icons/ai";
import { Card, CardContent, Typography, IconButton, Snackbar, Alert } from '@mui/material';

function Post({ post, selectedUser, onLikeUpdate }) {
  const [open, setOpen] = useState(false);
  const [likes, setLikes] = useState(post.likes);

  const handleLikes = async (postId) => {

    if (selectedUser === '') {
      setOpen(true);
      return;
    }

    const likeId = likes.filter(like => like.user_id == selectedUser)[0]?.id

    try {
      if (likeId) {
        await axios.delete(`/likes/${likeId}`);
        setLikes(likes.filter(like => like.id !== likeId));
        onLikeUpdate();
      } else {
        const newLike = {
          user_id: selectedUser,
          likeable_id: postId,
          likeable_type: 'Post',
          date: new Date()
        };
        const response = await axios.post(`/likes`, newLike);
        setLikes([...likes, { ...newLike, id: response.data.id }]);
        onLikeUpdate();
      }
    } catch (error) {
      console.error("Error handling like:", error);
    }
  };

  const handleClose = () => {
    setOpen(false);
  };

  return (
    <Card variant="outlined" sx={{ marginBottom: '20px', padding: '16px' }}>
      <CardContent>
        <Typography variant="h6" component="div">
          {post.title}
        </Typography>
        <Typography variant="body2" component="p" sx={{ marginBottom: '16px' }}>
          {post.body}
        </Typography>
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <IconButton onClick={() => handleLikes(post.id)}>
            {likes.filter(like => like.user_id == selectedUser).length ? (
              <AiFillHeart size={30} style={{ color: 'red' }} />
            ) : (
              <AiOutlineHeart size={30} />
            )}
          </IconButton>
          <Typography variant="body2" component="span">
            {likes.length} Likes
          </Typography>
        </div>
      </CardContent>
      <Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity="error">
          Please select a user first.
        </Alert>
      </Snackbar>
    </Card>
  );
}

export default Post;
