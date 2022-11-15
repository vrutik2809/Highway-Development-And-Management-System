import * as controller from '../../../app/controllers/tenders.controller.js'

export default async (req, res) => {
    await controller.getAllTenders(req,res);
}