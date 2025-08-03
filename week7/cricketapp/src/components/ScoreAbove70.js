import React from 'react';
import '../index.css';
const ScoreAbove70 = ({players}) => {
    const lowScoringPlayers = players.filter(player => player.score > 70);
  return (
    <div className="border">
      <h2>Team Players and Their Scores</h2>
      <ul className='no-bullets'>
      {lowScoringPlayers.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score} runs
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ScoreAbove70;