import React from 'react';
import '../index.css';
const ListofPlayers = ({players}) => {

  return (
    <div className="border">
      <h2>Team Players and Their Scores</h2>
      <ul className='no-bullets'>
        {players.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score} runs
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;