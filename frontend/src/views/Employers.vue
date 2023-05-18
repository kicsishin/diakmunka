
<template>
  <div>
    <h1>Employers</h1>
    <!-- tablazat -->
    <div>
      <table class="table w-auto">
        <thead>
          <tr >
            <th scope="col">Name</th>
          <th scope="col">Settlement</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(employer, index) in employers" :key="`employer${index}`"
         @click="onClickRow(employer.id)">
          
          <td> {{ employer.name }}</td>
          <td> {{ employer.settlement }} </td>
        </tr>
      </tbody>
    </table>

  </div>
  </div>
</template>

<script >
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();
export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      employers: [],
    };
  },
  mounted() {
    this.getEmployers();
  },
  methods: {
    async getEmployers() {
      let url = this.storeUrl.urlEmployers;
      console.log(url);
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.employers = data.data;
    },
  },
};
</script>


<style>
</style>
