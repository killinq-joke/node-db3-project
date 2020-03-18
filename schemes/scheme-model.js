const db = require("../configs")

module.exports = {
    find,
    findById
}

function find() {
    return db("schemes")
}

function findById(id) {
    return db("schemes").where({id})
}

function findSteps() {
    return db("schemes")
}