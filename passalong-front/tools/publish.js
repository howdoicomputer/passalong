/**
 * React Static Boilerplate
 * https://github.com/kriasoft/react-static-boilerplate
 *
 * Copyright Â© 2015-present Kriasoft, LLC. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE.txt file in the root directory of this source tree.
 */

const path = require('path');
const build = require('./build');
const task = require('./task');
const config = require('./config');
const s3 = require('s3');

module.exports = task('publish', () => new Promise((resolve, reject) => {
    const client = s3.createClient({
        s3Options: {
            region: 'us-east-1',
            sslEnabled: true
        },
    });
    const uploader = client.uploadDir({
        localDir: 'public',
        deleteRemoved: true,
        s3Params: { Bucket: 'passalong-front' }
    });
    uploader.on('error', reject);
    uploader.on('end', resolve);
}));
