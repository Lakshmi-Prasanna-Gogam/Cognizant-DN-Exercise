import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import heroImg from './assets/hero.png'
import './App.css'
import CalculateScore from './CalculateScore'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <CalculateScore Name={"Steeve"} School={"DNV Public School"} total={284} goal={3}/>
    </>
  )
}

export default App
