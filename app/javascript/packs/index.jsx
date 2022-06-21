// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

// import React from 'react'
// import ReactDOM from 'react-dom'
// import { createRoot } from 'react-dom/client'
// import PropTypes from 'prop-types'


// const Hello = props => (
//   <div>Hello {props.name}!</div>
// )

// Hello.defaultProps = {
//   name: 'David'
// }

// Hello.propTypes = {
//   name: PropTypes.string
// }

// document.addEventListener('DOMContentLoaded', () => {
//   reactDOMClient.render(
//     <Hello name="React" />,
//     document.body.appendChild(document.createElement('div')),
//   )
// })

// const container = document.getElementById('root')
// const root = createRoot(container)
// root.render(<App />)

import React from 'react'
import { createRoot } from 'react-dom/client'
// import 'index.css'
import App from './App'

const root = ReactDOM.createRoot(document.getElementById('root'))

root.render(
<React.ScriptMode>

{/* <App /> */}

</React.ScriptMode>
)