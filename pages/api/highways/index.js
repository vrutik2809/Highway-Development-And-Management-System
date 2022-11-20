import * as controller from '../../../app/controllers/highway.controller.js';

export default async (req, res) => {
    await controller.getAllHighways(req, res);
}