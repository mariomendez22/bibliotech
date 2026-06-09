const pool = require('@config/connection');

const login = async (req, res) => {

    try {

        const { usuario, password } = req.body;

        const [rows] = await pool.execute(
            `
            SELECT *
            FROM personal
            WHERE usuario = ?
            LIMIT 1
            `,
            [usuario]
        );

        if (!rows.length) {
            return res.status(401).json({
                success: false,
                message: 'Usuario no encontrado'
            });
        }

        const user = rows[0];

        if (user.password !== password) {
            return res.status(401).json({
                success: false,
                message: 'Contraseña incorrecta'
            });
        }

        return res.json({
            success: true,
            data: {
                id_personal: user.id_personal,
                usuario: user.usuario,
                nombre: `${user.nombre} ${user.apellidos}`,
                puesto: user.puesto
            }
        });

    } catch (error) {

        return res.status(500).json({
            success: false,
            message: error.message
        });

    }

};

module.exports = {
    login
};