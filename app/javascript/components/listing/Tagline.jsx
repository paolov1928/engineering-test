import React from 'react'

export default function({tagline}) {
  return tagline &&
    <p className='mb-0 mt-1 small'>
      <span className='text-uppercase'>
        {tagline}
      </span>
    </p>
}
