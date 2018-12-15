const express = require('express');
const PORT = 5000;

const app = express();

app.get('/', (req, res) => {
   res.json({
       message: 'WORKS!'
   });
});

app.listen(PORT, () =>{
    console.log('Listening On Port: '+PORT);
});

