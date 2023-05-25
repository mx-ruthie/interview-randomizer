import React from "react";
import { useAuth0 } from "@auth0/auth0-react";

const Profile = () => {
  const { user, isAuthenticated, isLoading } = useAuth0();

  if (isLoading) {
    return <div>Loading ...</div>;
  }

  return (
    isAuthenticated && (
      <div className="profilebox">
        {/* <img src={user.picture} alt={user.name} /> */}
        <h1>Best of luck, {user.given_name}! </h1>
      </div>
    )
  );
};

export default Profile;