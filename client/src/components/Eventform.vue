<template>
  <div class="">
    <div class="field">
      <label class="label">Titre</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Titre de votre évènement"
          required
        />
      </div>
    </div>
    <div class="field">
      <label class="label">Lieu</label>
      <div class="control">
        <input
          class="input"
          type="text"
          placeholder="Adresse de vitre évènement"
          required
        />
      </div>
    </div>
    <div class="field">
      <label class="label">Date</label>
      <div class="control">
        <input
          class="input"
          type="date"
          placeholder="date de votre évènement"
          required
        />
      </div>
    </div>

    <div class="field">
      <label class="label">Description</label>
      <div class="control">
        <textarea
          class="textarea"
          placeholder="Description"
          required
        ></textarea>
      </div>
    </div>

    <div class="field is-grouped">
      <div class="control">
        <button class="button is-link mr-5">Valider</button>
      </div>
      <div class="control">
        <button class="button is-link is-light">Annuler</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style></style>
