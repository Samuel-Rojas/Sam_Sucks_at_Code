import React from 'react'

export default function Card(props) {
    return (
        <>
            <div className="container">

                <img src={`./assets/${props.imageUrl}`} />

                <div className="location">
                     <p>{props.location}</p>
                     <a href={props.googleMapsUrl}></a>
                </div>
                
                <h1 className="card-title">{props.title}</h1>

                <span>{props.startDate}-{props.endDate}</span>

                <p>{props.description}</p>

            </div>
        </>
    )
}