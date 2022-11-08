export const getAllNotices = async (req, res) => {
    try {
        return res.status(200).json({ msg: 'get all notices controller' })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}

export const getNotice = async (req,res) => {
    try {
        return res.status(200).json({ msg: `get notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const addNotice = async (req,res) => {
    try {
        return res.status(201).json({ msg: `post notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const deleteNotice = async (req,res) => {
    try {
        return res.status(202).json({ msg: `delete notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}