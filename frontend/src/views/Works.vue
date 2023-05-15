
<template>
  <div class="row">
    <h1 class="felirat">Ready to work</h1>
    <div
      class="col-sm-4 mb-3 mb-sm-12"
      v-on:dblclick="Properties()"
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
    </div>

    <div
      class="modal fade"
      id="modalProperties"
      aria-labelledby="modalPropertiesModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
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
  },
  methods: {
    async getSPE() {
      let url = this.storeUrl.urlSPE;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.spes = data.data;
      console.log(spes);
    },

    Properties() {
      this.modal.show();
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
