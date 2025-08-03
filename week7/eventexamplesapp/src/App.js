import './App.css';
import { useState } from 'react';
function App() {
  const [counter,setCounter]=useState(0);
  const [euro, setEuro] = useState('');
  const [rupees, setRupees] = useState(null);
  const [currency, setCurrency] = useState(null);

  const handle=(text)=>{
    alert('Welcome');
  }
  const handlePress = () => {
    alert("I was clicked");
  };
  const handleSubmit=()=>{
    const euroValue = parseFloat(euro);
    if (!isNaN(euroValue)) {
      const converted = euroValue * 90; // Example rate: 1 Euro = 90 Rupees
      setRupees(converted.toFixed(2));
      alert('rupees is '+converted.toFixed(2));
    } else {
      alert("Please enter a valid number");
    }
  }
  return (
    <div className="App">
      <h1>{counter}</h1>
      <div className='btnbox'>
      <button onClick={()=>{
        setCounter((c)=>c+1);
        alert("Hello")}}>Increment</button>
        <button onClick={()=>{
        setCounter((c)=>c-1);}}>Decrement</button>
        <button onClick={()=>{
          handle('welcome')
        }
        }>Say Welcome</button>
        <button onClick={handlePress}>Click On Me</button>
      </div>
      <h1>Currency Convertor!!!</h1>
      <div>
        <h3>Amount</h3>
        <input
        type="text"
        value={euro}
        onChange={(e) => setEuro(e.target.value)}
        placeholder="Enter amount"
      />
      <h3>Currency</h3>
      <input
        type="text"
        value={currency}
        onChange={(e) => setCurrency(e.target.value)}
        placeholder="Currency"
      />
       <button onClick={handleSubmit}>Convert</button>
      </div>
    </div>
  );
}

export default App;
