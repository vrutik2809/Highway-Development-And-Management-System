import * as controller from '../../app/controllers/index.controller';

export default async (req, res) => {
    await controller.getAllHighways(req, res);
}