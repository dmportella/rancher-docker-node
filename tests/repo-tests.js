'use strict';
/* global describe, it, before, beforeEach, after, afterEach */

const expect = require('expect.js');
const Repository = require('../src/repository');

describe('Random tests of Repository', () => {
	describe('getData tests', () => {
		it('returns expect value', () => {
			const repo = new Repository('test');
			
			expect(repo.getData()).to.eql('hello test.');
		});
	});
});
