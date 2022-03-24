<template>
  <section class="hero is-fullheight">
    <backoHeader />
      <h4 class="title is-1 has-text-centered mt-6">Backoffice</h4>
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-6-widescreen">
            <div class="columns is-centered">
              <div class="card">
                <div class="card-content">
                  <div class="content">
                    <button class="button is-danger">
                      Supprimer les évènements expirés
                    </button>
                  </div>
                </div>
              </div>
              <div class="card ml-6">
                <div class="card-content">
                  <div class="content">
                    <button class="button is-danger">
                      Supprimer les comptes expirés
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {};
</script>

<style>
.title {
  color: white;
  font-family: "Poppins", sans-serif;
}
</style>
