const express = require('express');
const kneipenDB = require('monk')('localhost/kneipenapp');
const morgan = require('morgan');

const PORT = 5000;

const app = express();
const kneipen = kneipenDB.get('kneipen');

app.use(morgan('tiny'));

app.get('/', (req, res) => {
   res.json({
       message: 'WORKS!'
   });
});

app.get('/alleKneipen', (req, res) => {
    kneipen.find({}, 'name').then( kneipenListe => {
        for (i=0;i<kneipenListe.length;i++){
            console.log(kneipenListe[i].name);
        }
        res.json(kneipenListe);
      
    })
});

app.listen(PORT, () =>{
    console.log('Listening On Port: '+PORT);
});

