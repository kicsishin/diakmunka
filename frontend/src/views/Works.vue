
<template>
  <div>
    <h1>Ready to work</h1>

    <div>
      <table class="table w-auto">
        <thead>
          <tr>
            <th scope="col">Name</th>
            <th scope="col">Date Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(spe, index) in spes" :key="`spe${index}`">
            <td>{{ spe.sname }}</td>
            <td>{{ spe.datetime }}</td>
          </tr>
        </tbody>
      </table>
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
}
}

  
</script>


<style>
</style>
