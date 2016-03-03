'use strict';

class Repository {
	constructor(name) {
		this.name = name;
	}

	getData() {
		return `hello ${this.name}.`;
	}
}

module.exports = Repository;
