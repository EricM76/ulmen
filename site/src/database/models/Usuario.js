module.exports = (sequelize, DataTypes) => {

    let alias = "usuario"
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
        apellido: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        contraseña: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        DNI: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        
        nacimiento: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        id_sexo: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_rol: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },


    }
    let config = {
        timestamps : false
    }
    const usuario = sequelize.define(alias, cols, config);

    usuario.associate = function (models) {
        usuario.belongsTo(models.sexo, {
            foreignKey: "id_sexo",
            as: "sexo"
        })
    }
    
    usuario.associate = function (models) {
        usuario.belongsTo(models.rol, {
            foreignKey: "id_rol",
            as: "rol"
        })
    }



    return usuario
}