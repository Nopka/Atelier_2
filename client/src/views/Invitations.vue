<template>
  <section class="hero is-fullheight">
    <Header />
    <div class="hero-body">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-6-tablet is-5-desktop is-6-widescreen">
            <h4 class="title is-5 has-text-centered mb-20">
              Mes Invitations
            </h4>
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
                   <router-link to="/DetailEvent" class="button is-black is-light btn-footer">
                    Consulter
                  </router-link>
                  <button class="button is-success is-light btn-footer">
                    Accepter
                  </button>
                   <button class="button is-danger is-light btn-footer">
                    Refuser
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
                   <router-link to="/DetailEvent" class="button is-black is-light btn-footer">
                    Consulter
                  </router-link>
                  <button class="button is-success is-light btn-footer">
                    Accepter
                  </button>
                   <button class="button is-danger is-light btn-footer">
                    Refuser
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
                   <router-link to="/DetailEvent" class="button is-black is-light btn-footer">
                    Consulter
                  </router-link>
                  <button class="button is-success is-light btn-footer">
                    Accepter
                  </button>
                   <button class="button is-danger is-light btn-footer">
                    Refuser
                  </button>
             </footer>
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

<style lang="scss">
.title{
    color : white;
}

.btn-footer {
  margin: 10px 0em 10px 5em;
  width: 5em;
}
</style>
