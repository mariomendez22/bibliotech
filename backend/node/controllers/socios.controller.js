const pool = require('@config/connection');

const getAll = async (req, res) => {

    try {

        const [rows] = await pool.execute(`
            SELECT
                id_socio,
                CONCAT(nombre,' ',apellidos) AS nombre
            FROM socio
            WHERE estado_membresia = 'Activa'
            ORDER BY nombre
        `);

        res.json(rows);

    } catch (error) {

        res.status(500).json({
            success: false,
            message: error.message
        });

    }

};

module.exports = {
    getAll
};