import { pool } from "../configs/db.config"

const fetchTenders = async () => {
    try {
        const client = await pool.connect();
        const result = await client.query(
            `select t.id,t.description,t.proposed_for_highway_id as proposed_for,c.name as proposed_by
            from tenders as t join construction_companies as c
            on t.proposed_by_company_id = c.id
            order by t.id;`,
        );
        client.release();
        return result.rows;
    } catch (error) {
        throw new Error(error);
    }
}

export const getAllTenders = async (req, res) => {
    try {
        const notices = await fetchTenders();
        return res.status(200).json({ msg: 'success', data: notices });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}

export const createTender = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            insert into tenders (description,proposed_by_company_id,proposed_for_highway_id)
            values ('${req.body.description}',${req.body.proposed_by_company_id},${req.body.proposed_for_highway_id});
        `);
        client.release();
        return res.status(200).json({ msg: 'success' , data: result.rows});
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}