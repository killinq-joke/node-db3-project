const db = require("../configs");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
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

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(id => {
      console.log(id);
      return findById(id[0]);
    });
}

function addStep(step, schemeId) {
    step.scheme_id = schemeId
  return db("steps").insert(step)
  .then(ids => {
      return db("steps").where('id', ids[0])
  })
}

function update(changes, id) {
  return db("schemes")
    .update(changes)
    .where({ id })
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  if (isNaN(id)) {
    return null;
  } else {
    return db("schemes")
      .del()
      .where({ id });
  }
}
