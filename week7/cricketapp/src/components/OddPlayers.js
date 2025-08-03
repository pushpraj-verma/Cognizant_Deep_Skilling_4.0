import React from 'react'

const OddPlayers = ({players}) => {
    const oddTeam = [];
    const evenTeam = [];
  
    players.forEach((player, index) => {
      const { name, score } = player;
      if (index % 2 === 0) {
        evenTeam.push({ name, score });
      } else {
        oddTeam.push({ name, score });
      }
    });
  
    return (
      <div>
        <h2>Indian Team Players</h2>
  
        <h3>Odd Players</h3>
        <ul className="no-bullets">
          {oddTeam.map(({ name, score }, index) => (
            <li key={index}>{name} - {score} runs</li>
          ))}
        </ul>

        <h3>Even Players</h3>
        <ul className="no-bullets">
          {evenTeam.map(({ name, score }, index) => (
            <li key={index}>{name} - {score} runs</li>
          ))}
        </ul>
      </div>
    );
}

export default OddPlayers
