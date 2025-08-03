import './App.css';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import { useState } from 'react';
function App() {
  const [view, setView] = useState('blog'); // 'book', 'blog', 'course'
  let content;
  if (view === 'book') {
    content = <BookDetails />;
  } else if (view === 'blog') {
    content = <BlogDetails />;
  } else {
    content = <CourseDetails />;
  }
  return (
    <div className="App">
      <h2>Ternary Operator</h2>
      {
        view === 'book'
          ? <BookDetails />
          : view === 'blog'
            ? <BlogDetails />
            : <CourseDetails />
      }
      <hr />
      <hr />
      <div className='box'>
        <button onClick={() => setView('book')}>Book</button>
        <button onClick={() => setView('blog')}>Blog</button>
        <button onClick={() => setView('course')}>Course</button>
      </div>
    </div>
  );
}

export default App;
