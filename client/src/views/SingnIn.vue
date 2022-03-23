<template>
  <section class="hero is-fullheight">
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-4-widescreen">
            <h1 class="title is-2 ">Reunionou</h1>
            <div class="box">
              <h4 class="title is-4 has-text-centered inscrire"><b>S'inscrire</b></h4>

             <div class="field">
                <label class="label">Username</label>
                <div>
                  <input class="input is-small" type="email" placeholder="Veuillez saisir votre @mail"/>
                </div>
              </div>

              <div class="field">
                <label class="label">Email</label>
                <div>
                  <input class="input is-small" type="email" placeholder="Veuillez saisir votre @mail"/>
                </div>
                <!-- <p class="help is-danger">This email is invalid</p> -->
              </div>
              
              <div class="field">
                <label class="label">Password</label>
                <div>
                  <input class="input is-small " type="text"
                    placeholder="Veuillez saisir votre mot de passe" />
                </div>
                <!-- <p class="help is-danger">This username is available</p> -->
              </div>

             <div class="field">
                <label class="label">Confirm passowrd</label>
                <div>
                  <input class="input is-small" type="text"
                    placeholder="Veuillez saisir votre mot de passe" />
                </div>
                <!-- <p class="help is-danger">The password does not match </p> -->
              </div>
              
              <div class="field is-grouped">
                <div class="control">
                  <button class="button is-link">valider</button>
                </div>
              </div>
            </div>
            <div class="box"> Vous avez déjà un compte ? <router-link class="is-text" to="/">Se connecter</router-link > 
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  mounted() {},
  data() {},
  methods: {},
};
</script>
<style lang="scss">
.title{
  text-align: center;
  font-family: "Abril Fatface", sans-serif;
  color: white;
}
.inscrire{
  color: rgb(49, 47, 47);
}
@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Alegreya+Sans:wght@300&family=Cormorant+Garamond:wght@300;600&family=Lora:wght@500&family=Old+Standard+TT&family=Pacifico&family=Poppins&family=Roboto+Mono:wght@500&family=Roboto:wght@300;400&family=Space+Mono&display=swap');
</style>
