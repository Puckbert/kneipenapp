const express = require('express');
const kneipenDB = require('monk')('localhost/kneipenapp');
const morgan = require('morgan');
const rad2deg = require('./radiusBerechnen');

const PORT = 5000;

const app = express();
const kneipen = kneipenDB.get('kneipen');
console.log(rad2deg(3.1415));

app.use(morgan('tiny'));

app.get('/', (req, res) => {
   res.json({
       message: 'WORKS!'
   });
});

app.get('/alleKneipen', (req, res) => {
    kneipen.find({}, {standort: 1,_id:0}).then( kneipenListe => {
        console.log(kneipenListe);
        res.json(JSON.stringify(kneipenListe));
    })
});

app.listen(PORT, () =>{
    console.log('Listening On Port: '+PORT);
});

