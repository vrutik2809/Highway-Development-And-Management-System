import { pool } from "../configs/db.config"

const fetchNotices = async (notice_id = null) => {
    try {
        const client = await pool.connect();
        const result = await client.query(
            `select *
            from notices
            ${notice_id ? `where id = ${notice_id}` : ''}
            order by id;`,
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
        const notices = await fetchNotices(req.query.notice_id);
        return res.status(200).json({ msg: 'success', data: notices });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const addNotice = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            insert into notices(description)
            values('${req.body.description}');
        `);
        client.release();
        return res.status(201).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const deleteNotice = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            delete from notices
            where id = ${req.query.notice_id};
        `);
        return res.status(202).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}

export const updateNotice = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            update notices
            set description = '${req.body.description}'
            where id = ${req.query.notice_id};
        `);
        return res.status(203).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' })
    }
}