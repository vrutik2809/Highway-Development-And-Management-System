import { pool } from "../configs/db.config"

const fetchHighways = async (highway_id = null) => {
    try {
        const client = await pool.connect();
        const result = await client.query(
            `select h.id,h.type,h.length,h.cost,h.build_year,(
                select l.name
                from locations as l
                where l.id = h.start_location_id
            ) as start_location,(
                select l.name
                from locations as l
                where l.id = h.end_location_id
            ) as end_location
            from highways as h
            ${highway_id ? `where h.id = ${highway_id}` : ''};`
        );
        client.release();
        return result.rows;
    } catch (error) {
        throw new Error(error);
    }
}

export const getAllHighways = async (req, res) => {
    try {
        const highways = await fetchHighways();
        return res.status(200).json({ msg: 'success', data: highways });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ msg: 'server error' });
    }
}