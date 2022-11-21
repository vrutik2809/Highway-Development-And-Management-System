import * as controller from '../../../app/controllers/static.controller.js'

export default async (req, res) => {
    if(req.method === 'GET'){
        await controller.getAllTableNames(req,res);
    }
    else{
        res.status(405).send({message: 'Method not allowed'});
    }
}