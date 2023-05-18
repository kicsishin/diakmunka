
<template>
  <div>
    <h1 class="felirat mb-5">Munkák</h1>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 g-4">
      <div class="col" v-for="(spe, index) in spes" :key="`spe${index}`">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">{{ spe.job }}</h5>
            <p class="card-text">
              {{ spe.ename }}
            </p>
            <button
              type="button"
              class="btn btn-primary"
              @click="onClickProperties(spe.pid)"
            >
              Részletek
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- <div
      class="col-sm-4 mb-3 mb-sm-12"
      v-for="(spe, index) in spes"
      :key="`spe${index}`"
    >
      <div class="card" style="width: 18rem">
        <div class="card-body">
          <h5 class="card-title">{{ spe.job }}</h5>
          <p class="card-text">
            {{ spe.ename }}
          </p>
        </div>
      </div>
    </div> -->

    <div
      class="modal fade"
      id="modalProperties"
      aria-labelledby="modalPropertiesModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Properties</h5>
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>Modal body text goes here.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary">Save changes</button>
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      spes: [],
      modal: null,
    };
  },
  mounted() {
    this.getSPE();
    this.modal = new bootstrap.Modal(
      document.getElementById("modalProperties"),
      {
        keyboard: false,
      }
    );
    this.form = document.querySelector(".needs-validation");
  },
  methods: {
    async getSPE() {
      let url = this.storeUrl.urlSPE;
      console.log(url);
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.spes = data.data;
    },
    Properties() {
      this.modal.show();
    },
    onClickProperties(id) {
      console.log(id);
    },
  },
};
</script>


<style>
.card {
  background-color: rosybrown;
}
.felirat {
  text-align: center;
  vertical-align: middle;
  background-color: rosybrown;
  font-family: Georgia, "Times New Roman", Times, serif;
}
</style>
