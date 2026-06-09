const pool = require('@config/connection');

const create = async (req, res) => {

    const {
        id_socio,
        id_ejemplar,
        id_personal_entrega,
        fecha_limite
    } = req.body;

    const conn = await pool.getConnection();

    try {

        await conn.beginTransaction();

        const [ejemplares] = await conn.execute(`
            SELECT disponibilidad
            FROM ejemplar
            WHERE id_ejemplar = ?
        `,[id_ejemplar]);

        if (ejemplares.length === 0) {
            throw new Error('Ejemplar no encontrado');
        }

        if (!ejemplares[0].disponibilidad) {
            throw new Error('Ejemplar no disponible');
        }

        const [result] = await conn.execute(`
            INSERT INTO prestamo (
                fecha_salida,
                fecha_limite,
                estado,
                id_socio,
                id_ejemplar,
                id_personal_entrega
            )
            VALUES (
                CURDATE(),
                ?,
                'Activo',
                ?,
                ?,
                ?
            )
        `,[
            fecha_limite,
            id_socio,
            id_ejemplar,
            id_personal_entrega
        ]);

        await conn.execute(`
            UPDATE ejemplar
            SET disponibilidad = 0
            WHERE id_ejemplar = ?
        `,[id_ejemplar]);

        await conn.commit();

        res.json({
            success: true,
            message: 'Préstamo registrado',
            id_prestamo: result.insertId
        });

    } catch (error) {

        await conn.rollback();

        res.status(400).json({
            success: false,
            message: error.message
        });

    } finally {

        conn.release();

    }

};
const getActivos = async (req, res) => {

    try {

        const [rows] = await pool.execute(`
            SELECT
                p.id_prestamo,
                CONCAT(s.nombre,' ',s.apellidos) AS socio,
                l.titulo AS libro,
                e.codigo_barras,
                p.fecha_salida,
                p.fecha_limite,
                pe.nombre AS bibliotecario,
                CASE
                    WHEN CURDATE() > p.fecha_limite
                    THEN DATEDIFF(CURDATE(), p.fecha_limite)
                    ELSE 0
                END AS dias_retraso
            FROM prestamo p
            INNER JOIN socio s
                ON s.id_socio = p.id_socio
            INNER JOIN ejemplar e
                ON e.id_ejemplar = p.id_ejemplar
            INNER JOIN libro l
                ON l.id_libro = e.id_libro
            INNER JOIN personal pe
                ON pe.id_personal = p.id_personal_entrega
            WHERE p.estado = 'Activo'
            ORDER BY p.fecha_limite
        `);

        res.json(rows);

    } catch (error) {

        res.status(500).json({
            success: false,
            message: error.message
        });

    }

};
const devolver = async (req, res) => {

    const { id } = req.params;
    const { id_personal_recibe } = req.body;

    const conn = await pool.getConnection();

    try {

        await conn.beginTransaction();

        const [prestamos] = await conn.execute(`
            SELECT id_ejemplar
            FROM prestamo
            WHERE id_prestamo = ?
            AND estado = 'Activo'
        `,[id]);

        if (prestamos.length === 0) {
            throw new Error(
                'Préstamo no encontrado'
            );
        }

        const idEjemplar =
            prestamos[0].id_ejemplar;

        await conn.execute(`
            UPDATE prestamo
            SET
                estado = 'Devuelto',
                fecha_devolucion_real = CURDATE(),
                id_personal_recibe = ?
            WHERE id_prestamo = ?
        `,[
            id_personal_recibe,
            id
        ]);

        await conn.execute(`
            UPDATE ejemplar
            SET disponibilidad = 1
            WHERE id_ejemplar = ?
        `,[idEjemplar]);

        await conn.commit();

        res.json({
            success: true,
            message: 'Devolución registrada'
        });

    } catch (error) {

        await conn.rollback();

        res.status(400).json({
            success: false,
            message: error.message
        });

    } finally {

        conn.release();

    }

};
const getHistorico = async (req, res) => {

    try {

        const [rows] = await pool.execute(`
            SELECT
                p.id_prestamo,
                CONCAT(s.nombre,' ',s.apellidos) AS socio,
                l.titulo AS libro,
                e.codigo_barras,
                p.fecha_salida,
                p.fecha_limite,
                p.fecha_devolucion_real,
                pe.nombre AS entregado_por,
                pr.nombre AS recibido_por,
                CASE
                    WHEN p.fecha_devolucion_real > p.fecha_limite
                    THEN DATEDIFF(
                        p.fecha_devolucion_real,
                        p.fecha_limite
                    )
                    ELSE 0
                END AS dias_retraso
            FROM prestamo p
            INNER JOIN socio s
                ON s.id_socio = p.id_socio
            INNER JOIN ejemplar e
                ON e.id_ejemplar = p.id_ejemplar
            INNER JOIN libro l
                ON l.id_libro = e.id_libro
            INNER JOIN personal pe
                ON pe.id_personal = p.id_personal_entrega
            LEFT JOIN personal pr
                ON pr.id_personal = p.id_personal_recibe
            WHERE p.estado = 'Devuelto'
            ORDER BY p.fecha_devolucion_real DESC
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
    create,
    getActivos,
    devolver,
    getHistorico
};