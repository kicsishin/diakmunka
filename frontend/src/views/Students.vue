
<template>
  <div>
    <h1>Students</h1>

    <div>
      <table class="table w-auto">
        <thead>
          <tr >
            <th scope="col"><button type="button" class="btn btn-sm btn-outline-success">New</button></th>
            <th scope="col">Name</th>
          <th scope="col">Date Time</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(student, index) in students" :key="`student${index}`">
          <td>
            <button type="button" class="btn btn-sm btn-outline-primary m-2"><i class="bi bi-pencil"></i></button>
            <button type="button" class="btn btn-sm btn-outline-danger m-1"><i class="bi bi-trash"></i></button>
          </td>
          <td> {{ student.name }}</td>
          <td> {{ student.datetime }} </td>
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
      students: [],
    };
  },
  mounted() {
    this.getStudents();
  },
  methods: {
    async getStudents() {
      let url = this.storeUrl.urlStudents;
      console.log(url);
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.students = data.data;
    },
  },
};
</script>


<style>
th, td{
  text-align: center;
  vertical-align: middle;
  font-family: Georgia, 'Times New Roman', Times, serif;
}
h1, table{
  font-family: Georgia, 'Times New Roman', Times, serif;
  text-align: center;
  background-color: antiquewhite;
}
</style>
