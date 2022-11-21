import { pool } from "../configs/db.config"

export const getAllTableNames = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            select table_name, row_number() over (order by (select null)) as id
            from information_schema.tables
            where table_schema = 'public';
        `)
        client.release();
        return res.status(200).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}

export const getAllColumnNames = async (req, res) => {
    try {
        const client = await pool.connect();
        const result = await client.query(`
            select column_name, row_number() over (order by (select null)) as id
            from information_schema.columns
            where table_name = '${req.query.table_name}';
        `)
        client.release();
        return res.status(200).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}

export const getAllRowsFromTable = async (req, res) => {
    try {
        const client = await pool.connect();
        if(req.query.table_name === 'state_highways' || req.query.table_name === 'contract_related_civil_engineers'){
            const result = await client.query(`
                select row_number() over (order by (select null)) as id, *
                from ${req.query.table_name};
            `)
            client.release();
            return res.status(200).json({ msg: 'success', data: result.rows });
        }
        const result = await client.query(`
            select *
            from ${req.query.table_name};
        `)
        client.release();
        return res.status(200).json({ msg: 'success', data: result.rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}