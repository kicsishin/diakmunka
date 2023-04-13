
<template>
  <div>
    <h1>Students</h1>
    <div v-for="(student, index) in students" :key="`student${index}`">
      <h2>
        {{ student.name }} {{ student.datetime }} 
      </h2>
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
</style>
