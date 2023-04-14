
<template>
  <div>
    <h1>Employers</h1>
    <!-- tablazat -->
    <div>
      <table class="table w-auto">
        <thead>
          <tr >
            <th scope="col"><button type="button" class="btn btn-sm btn-outline-success" @click="onClickNew()" data-bs-toggle="modal" data-bs-target="#exampleModal">New</button></th>
            <th scope="col">Name</th>
          <th scope="col">Settlement</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(employer, index) in employers" :key="`employer${index}`">
          <td>
            <button type="button" class="btn btn-sm btn-outline-primary m-2" @click="onClickEdit(employer.id)"><i class="bi bi-pencil"></i></button>
            <button type="button" class="btn btn-sm btn-outline-danger m-1" @click="onClickDelete(employer.id)"><i class="bi bi-trash"></i></button>
          </td>
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
