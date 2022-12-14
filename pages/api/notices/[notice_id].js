import * as controller from '../../../app/controllers/notices.controller.js'
import { auth } from '../../../app/middlewares/auth.middleware.js';
import { flags } from '../../../app/enums.js';

export default async (req, res) => {
    if (req.method === 'GET') {
        await controller.getNotice(req, res);
    }
    else if (req.method === 'DELETE') {
        const sts = await auth(req, res);
        if (sts !== flags.SUCCESS) {
            if(sts === flags.FAIL) return res.status(401).json({ msg: 'unauthorized' });
            else return res.status(500).json({ msg: 'server error' });
        }
        await controller.deleteNotice(req, res);
    }
    else if (req.method === 'PUT') {
        const sts = await auth(req, res);
        if (sts !== flags.SUCCESS) {
            if(sts === flags.FAIL) return res.status(401).json({ msg: 'unauthorized' });
            else return res.status(500).json({ msg: 'server error' });
        }
        await controller.updateNotice(req, res);
    }
}