import './App.css';
import { useState } from 'react';
function App() {
  const [flag,setFlag]=useState(true)
  return (
    <div className="App">
      {
        flag === true ? (
          <div>
            <h1>Please Sign Up</h1>
          <button onClick={()=>{
            setFlag(false);
          }}>login</button>
          </div>
        ) : (
          <div>
            <h1>Welcome Back</h1>
          <button onClick={()=>{
            setFlag(true);
          }}>logout</button>
            </div>
        )
      }
    </div>
  );
}

export default App;
