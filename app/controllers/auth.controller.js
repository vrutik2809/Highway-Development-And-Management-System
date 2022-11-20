import { pool } from "../configs/db.config"

export const login = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            select u.id,u.type
            from users u
            where u.username = '${req.body.username}' and u.password = '${req.body.password}';
        `);
        client.release();
        if (result.rows.length > 0) {
            return res.status(200).json({ msg: 'success', data: result.rows[0] });
        }
        return res.status(401).json({ msg: 'unauthorized' });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}