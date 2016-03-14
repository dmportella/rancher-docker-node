'use strict';

const express = require('express');
const router = new express.Router();
const os = require('os');

const appHealth = {
	throw500: false,
	timeout: false,
	killProcess: false
};

/* eslint-disable no-unused-vars */
router.get('/throw500', (req, res, next) => {
	appHealth.throw500 = !appHealth.throw500;
	res.send('ok');
})
.get('/timeout', (req, res, next) => {
	appHealth.timeout = !appHealth.timeout;
	res.send('ok');
})
.get('/killProcess', (req, res, next) => {
	appHealth.killProcess = !appHealth.killProcess;
	res.send('ok');
})
.get('/', (req, res, next) => {
	if (appHealth.throw500) {
		throw new Error('appHealth.throw500');
	} else if (appHealth.killProcess) {
		process.exit(1);
	} else if (!appHealth.timeout) {
		res.json(
			{
				version: '1.0.0',
				status: 'OK',
				hostname: os.hostname(),
				versions: process.versions,
				process: {
					uptime: process.uptime,
					memoryUsage: process.memoryUsage(),
					platform: process.platform,
					arch: process.arch,
					title: process.title
				},
				cpus: os.cpus(),
				network: os.networkInterfaces()
			});
	}
});
/* eslint-disable no-unused-vars */

module.exports = router;
