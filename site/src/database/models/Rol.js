module.exports = (sequelize, DataTypes) => {

    let alias = "Rol"
    let cols = {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            allowNull: false,
            autoIncrement: true,
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },

    }
    let config = {
        timestamps : false
    }
    const Rol = sequelize.define(alias, cols, config)

    Rol.associate = function (models) {
        Rol.belongsTo(models.Usuarios, {
            foreignKey: "id_rol",
            as: "usuario"
        })
    }


    return Rol

}