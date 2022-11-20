import * as controller from '../../../app/controllers/auth.controller';

export default async (req, res) => {
    if (req.method === 'POST') {
        await controller.login(req, res);
    }
    else{
        res.status(405).json({ msg: 'method not allowed' });
    }
}