const pool = require('@config/connection');

const getAll = async (req, res) => {

    try {

        const [rows] = await pool.execute(`
            SELECT
                l.id_libro,
                l.titulo
            FROM libro l
            INNER JOIN ejemplar e
                ON e.id_libro = l.id_libro
            WHERE e.disponibilidad = 1
            GROUP BY l.id_libro,l.titulo
            ORDER BY l.titulo
        `);

        res.json(rows);

    } catch (error) {

        res.status(500).json({
            success: false,
            message: error.message
        });

    }

};

const getEjemplares = async (req, res) => {

    try {

        const { id } = req.params;
        console.log(`Cargando ejemplares para libro ${id}`);
        const [rows] = await pool.execute(`
            SELECT
                id_ejemplar,
                codigo_barras
            FROM ejemplar
            WHERE id_libro = ?
            AND disponibilidad = 1
            ORDER BY codigo_barras
        `,[id]);

        res.json(rows);

    } catch (error) {

        res.status(500).json({
            success: false,
            message: error.message
        });
    }
};

module.exports = {
    getAll,
    getEjemplares
};