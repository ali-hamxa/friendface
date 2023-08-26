import React, { useState, useEffect } from "react";
import axios from "../Api/axios";
import { Card, CardContent, Typography, List, ListItem } from '@mui/material';

function LikeStats({ likeCountUpdated }) {
  const [mostLikedDays, setMostLikedDays] = useState({});
  const [likeStreaks, setLikeStreaks] = useState([]);

  useEffect(() => {
    fetchMostLikedDays();
    fetchLikeStreaks();
  }, [likeCountUpdated]);

  const fetchMostLikedDays = async () => {
    try {
      const response = await axios.get("/likes/most_liked_days");
      setMostLikedDays(response.data);
    } catch (error) {
      console.error("Error fetching most liked days:", error);
    }
  };

  const fetchLikeStreaks = async () => {
    try {
      const response = await axios.get("/likes/like_streaks");
      setLikeStreaks(response.data);
    } catch (error) {
      console.error("Error fetching like streaks:", error);
    }
  };

  const titleize = text => text.charAt(0).toUpperCase() + text.slice(1).toLowerCase();

  return (
    <Card variant="outlined" sx={{ margin: '20px', boxShadow: '0 4px 8px rgba(0,0,0,0.1)' }}>
      <CardContent>
        <Typography variant="h5" component="div" sx={{ marginBottom: '16px', borderBottom: '1px solid #ccc' }}>
          Most Liked Days
        </Typography>
        <List>
          {Object.keys(mostLikedDays).map((day) => (
            <ListItem key={day} sx={{ backgroundColor: '#f9f9f9', margin: '5px 0', padding: '10px', borderRadius: '5px' }}>
              {titleize(day)}: {mostLikedDays[day]} likes
            </ListItem>
          ))}
        </List>

        <Typography variant="h5" component="div" sx={{ marginTop: '16px', marginBottom: '16px', borderBottom: '1px solid #ccc' }}>
          Like Streaks
        </Typography>
        <List>
          {likeStreaks.map((streak, index) => (
            <ListItem key={index} sx={{ backgroundColor: '#f9f9f9', margin: '5px 0', padding: '10px', borderRadius: '5px' }}>
              Streak Count: {streak.streakcount} | Dates: {streak.dates.join(", ")}
            </ListItem>
          ))}
        </List>
      </CardContent>
    </Card>
  );
}

export default LikeStats;
