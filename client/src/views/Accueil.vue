<template>
  <section class="hero is-fullheight">
    <Header />
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-6-widescreen">
            <h4 class="title is-5 has-text-centered mb-20">Mes évèments</h4>
            <div class="columns is-centered">
              <div class="box button-wrap">
                <div class="buttons">
                  <router-link
                    class="button button is-info is-hovered"
                    to="/FormEvent"
                    >Créer un évènement</router-link
                  >
                </div>
              </div>
            </div>
            <div class="card mb-5">
              <div class="card-content">
                <div class="content">
                  <p class="subtitle">L'anniv de Rita</p> 
                  <time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time> 
                  <p class="">@johnsmith</p>

                </div>
              </div>
              <div class="card">
                <footer class="card-footer">
                  <button
                    class="button is-warning is-light btn-footer js-modal-trigger"
                  >
                    Modifier
                  </button>
                  <button
                    class="button is-danger is-light btn-footer js-modal-trigger"
                    data-target="supprimer"
                    @click="showModalSupp"
                  >
                    Supprimer
                  </button>
                  <button
                    class="button is-info is-light btn-footer js-modal-trigger"
                    data-target="inviter"
                    @click="showModalInvite"
                  >
                    Inviter
                  </button>
                  <button
                    class="button is-black is-light btn-footer js-modal-trigger"
                    data-target="lien"
                    @click="showModalLien"
                  >
                    lien
                  </button>
                </footer>
              </div>
            </div>
            <div class="card mb-5">
              <div class="card-content">
                <div class="content">
                  Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at
                  eros. Donec id elit non mi porta gravida at eget metus. Cum
                  sociis natoque penatibus et magnis dis parturient montes,
                  nascetur ridiculus mus. Cras mattis consectetur purus sit amet
                  fermentum.
                </div>
              </div>
              <div class="card">
                <footer class="container is-fullhd">
                     <button class="button is-warning is-light btn-footer">
                    Modifier
                  </button>
                  <button class="button is-danger is-light btn-footer">
                    Supprimer
                  </button>
                  <button class="button is-info is-light btn-footer">
                    Inviter
                  </button>
                  <button class="button is-black is-light btn-footer">
                    lien
                  </button>

              
                </footer>
              </div>
            </div>
            <div class="card mb-5">
              <div class="card-content">
                <div class="content">
                  Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at
                  eros. Donec id elit non mi porta gravida at eget metus. Cum
                  sociis natoque penatibus et magnis dis parturient montes,
                  nascetur ridiculus mus. Cras mattis consectetur purus sit amet
                  fermentum.
                </div>
              </div>
              <div class="card">
                <footer class="card-footer">
                  <button class="button is-warning is-light btn-footer">
                    Modifier
                  </button>
                  <button class="button is-danger is-light btn-footer">
                    Supprimer
                  </button>
                  <button class="button is-info is-light btn-footer">
                    Inviter
                  </button>
                  <button class="button is-black is-light btn-footer">
                    lien
                  </button>
                </footer>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modals -->
    <div id="inviter" class="modal" :class="{ 'is-active': showModalFlagI }">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Inviter</p>
          <button
            class="delete"
            aria-label="close"
            @click="cancelModalInvite"
          ></button>
        </header>
        <section class="modal-card-body">
          <input
            class="input is-link"
            type="text"
            placeholder="Entrer le username ou l'email"
          />
        </section>
        <footer class="modal-card-foot">
          <button class="button is-success">Envoyer</button>
          <button class="button ml-2" @click="cancelModalInvite">
            Annuler
          </button>
        </footer>
      </div>
    </div>
    <div id="supprimer" class="modal" :class="{ 'is-active': showModalFlag }">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Supprimer</p>
          <button
            class="delete"
            aria-label="close"
            @click="cancelModalSupp"
          ></button>
        </header>
        <section class="modal-card-body">
          <p>vous êtes sur de supprimer cet évènement?</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button is-success">Oui</button>
          <button class="button ml-2" @click="cancelModalSupp">Non</button>
        </footer>
      </div>
    </div>
    <div id="lien" class="modal" :class="{ 'is-active': showModalFlagL }">
      <div class="modal-background"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Lien</p>
          <button
            class="delete"
            aria-label="close"
            @click="cancelModalLien"
          ></button>
        </header>
        <section class="modal-card-body">
          <p>Le lien de l'évènement</p>

            <div class="field has-addons has-addons-centered">
                  <p class="">
                    <input class="input" type="text" placeholder="link">
                  </p>
                  <p class="">
                    <a class="button is-primary">
                      Copy
                    </a>
                  </p>
            </div>
        </section>
        <footer class="modal-card-foot">
          <button class="button" @click="cancelModalLien">Cancel</button>
        </footer>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      showModalFlagI: false,
      showModalFlag: false,
      showModalFlagL: false,
    };
  },
  methods: {
    showModalInvite() {
      this.showModalFlagI = true;
    },
    cancelModalInvite() {
      this.showModalFlagI = false;
    },
    showModalSupp() {
      this.showModalFlag = true;
    },
    cancelModalSupp() {
      this.showModalFlag = false;
    },
    showModalLien() {
      this.showModalFlagL = true;
    },
    cancelModalLien() {
      this.showModalFlagL = false;
    },
  },
};
</script>

<style lang="scss">
.title {
  color: white;
  font-family: "Poppins", sans-serif;
}
.btn-footer {
  margin: 10px 0em 10px 3em;
  width: 5em;
}
footer .container{
  display: flex;
  justify-content: space-between;
}
</style>
