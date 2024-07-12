
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import React from 'react'
import './App.css'
import Card from '/components/Card'
import Navbar from "/components/Navbar.jsx"
import data from './assets/data.js'

export default function App() {

  const card = data.map((item => {
    return (
      <Card 
    
        imageUrl = {item.imageUrl}
        title={item.title}
        location={item.location}
        googleMapsUrl={item.googleMapsUrl}
        startDate={item.startDate}
        endDate={item.endDate}
        description={item.description}
      />
    )
  }))

  return (
    <>
      <Navbar />
      {card}
    </>
  )
}


