const proxy = require('@sap/cds-odata-v2-adapter-proxy');
const cds = require('@sap/cds');
const cors = require('cors');
cds.on('bootstrap', (app) => {
    app.use(cors());
    app.use(proxy());
})
module.exports = cds.server