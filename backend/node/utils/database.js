const pool = require('@config/connection');

const execute = async (
    sql,
    params = []
) => {

    try {

        const [rows] =
            await pool.execute(
                sql,
                params
            );

        return rows;

    } catch (error) {

        console.error(error);

        throw error;
    }

};

module.exports = {
    execute
};