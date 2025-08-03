import ListofPlayers from "./components/ListofPlayers";
import OddPlayers from "./components/OddPlayers";
import ScoreAbove70 from "./components/ScoreAbove70";
import './index.css';
function App() {
  const players = [
    { name: "Virat Kohli", score: 85 },
    { name: "Rohit Sharma", score: 78 },
    { name: "Shubman Gill", score: 65 },
    { name: "KL Rahul", score: 49 },
    { name: "Hardik Pandya", score: 38 },
    { name: "Ravindra Jadeja", score: 58 },
    { name: "Rishabh Pant", score: 42 },
    { name: "Jasprit Bumrah", score: 10 },
    { name: "Mohammed Shami", score: 15 },
    { name: "Kuldeep Yadav", score: 5 },
    { name: "Bhuvneshwar Kumar", score: 25 }
  ];
  var flag=true;
  return (
    <div className="app">
      <h1>Welcome to Cricket App</h1>
      {
    flag ? (
      <>
        <ListofPlayers players={players} />
        <ScoreAbove70 players={players} />
      </>
    ) : (
      <OddPlayers players={players} />
    )
  }
    </div>
  );
}

export default App;
