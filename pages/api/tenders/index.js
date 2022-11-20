import * as controller from '../../../app/controllers/tenders.controller.js'

export default async (req, res) => {
    if(req.method === 'GET'){
        await controller.getAllTenders(req,res);
    }
    else if(req.method === 'POST'){
        await controller.createTender(req,res);
    }
}