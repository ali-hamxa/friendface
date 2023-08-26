import React from "react";
import { FormControl, InputLabel, Select, MenuItem } from '@mui/material';

function UserSelector({ users, selectedUser, handleUserChange }) {
  return (
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
      <FormControl variant="outlined" sx={{ width: '50%' }}>
        <InputLabel>Select User</InputLabel>
        <Select
          label="Select User"
          value={selectedUser}
          onChange={handleUserChange}
        >
          <MenuItem value="">
            <em>None</em>
          </MenuItem>
          {users.map((user) => (
            <MenuItem value={user.id} key={user.id}>
              {user.name}
            </MenuItem>
          ))}
        </Select>
      </FormControl>
    </div>
  );
}

export default UserSelector;
