const express = require('express');
const kneipenDB = require('monk')('localhost/kneipenapp');
const morgan = require('morgan');
const cors = require('cors');
const Joi = require('joi');

const PORT = 8080;

const geoSchema = Joi.object().keys({
    type: Joi.string().default('Point'),
    coordinates: Joi.array().items(Joi.number())
});

const kneipeSchema = Joi.object().keys({
    name: Joi.string().required(),
    oeffnungszeiten: Joi.array().items(Joi.string()),
    geometry: geoSchema
});

const app = express();
const kneipen = kneipenDB.get('kneipen');
app.use(cors());
app.use(morgan('tiny'));

app.get('/', (req, res) => {
    res.json({
        message: 'WORKS!'
    });
});

app.get('/getKneipeVonName', (req, res) => {
    kneipen.find({
        name: req.query.name
    }).then(kneipe => {
        res.send(kneipe);
    })
});

app.get('/getKneipeInUmkreis', (req, res) => {
    kneipen.geoNear({
        type: 'Point',
        coordinates: [parseFloat(req.query.lat), parseFloat(req.query.lng)]
    }, {
        maxDistance: parseFloat(req.query.rad),
        spherical: true
    }).then((kneipenListe) => {
        res.send(kneipenListe);
    }).catch(error => {
        console.log('CAUGHT!');
    });
});

app.get('/alleKneipen', (req, res) => {
    kneipen.find().then(alleKneipen => {
        res.send(alleKneipen);
    })
})

app.listen(PORT, () => {
    console.log('Listening On Port: ' + PORT);
});