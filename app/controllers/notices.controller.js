import { pool } from "../configs/db.config"

const fetchNotices = async (notice_id = null) => {
    try {
        const client = await pool.connect();
        const result = await client.query(
            `select *
            from notices
            ${notice_id ? `where id = ${notice_id}` : ''};`,
        );
        client.release();
        return result.rows;
    } catch (error) {
        throw new Error(error);
    }
}

export const getAllNotices = async (req, res) => {
    try {
        const notices = await fetchNotices();
        return res.status(200).json({ msg: 'success', data: notices });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}

export const getNotice = async (req, res) => {
    try {
        return res.status(200).json({ msg: `get notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const addNotice = async (req, res) => {
    try {
        return res.status(201).json({ msg: `post notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const deleteNotice = async (req, res) => {
    try {
        return res.status(202).json({ msg: `delete notice controller` })
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}