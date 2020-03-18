const db = require("../configs");

module.exports = {
  find,
  findById,
  findSteps
};

function find() {
  return db("schemes");
}

function findById(id) {
  if (isNaN(id)) {
    return null;
  } else {
    return db("schemes").where({ id });
  }
}

function findSteps(id) {
  return db
    .select(
      "scheme_name",
      "steps.id",
      "steps.step_number",
      "steps.instructions"
    )
    .from("schemes")
    .join("steps", { "schemes.id": "steps.scheme_id" })
    .where("schemes.id", id)
    .orderBy("step_number");
}

function add(schemeData) {
  return db.insert(schemeData);
}
