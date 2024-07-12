import React from 'react'
import icon from '/src/assets/travel-journal.png'

export default function Navbar() {
    return (
        <nav className="navbar-section">
            <img src={icon} className="nav-icon"/>
            <h3>my travel journal.</h3>
        </nav>
    )
    
}