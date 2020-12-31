import React from 'react'
import {Route, Switch} from 'react-router-dom'
import Coin from './Coin/coin'
import Coins from './Coins/coins'

const App = () => {
 return (
   <Switch>
    <Route exact path="/" component = {Coins}/>
    <Route exact path="/coins/:slug" component = {Coin}/>
   </Switch>
 )
}

export default App
