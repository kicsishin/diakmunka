
<template>
  <div class="row">
    <h1 class="felirat">Projects</h1>
    <div
      class="col-sm-4 mb-3 mb-sm-12"
      v-for="(project, index) in projects"
      :key="`project${index}`"
    >
      <div class="card" style="width: 18rem">
        <div class="card-body">
          <h5 class="card-title">{{ project.job }}</h5>
          <p class="card-text">
            {{ project.date }}
          </p>
        </div>
        <ul class="list-group list-group-flush card-prop">
          <li class="list-group-item">Órabér: {{ project.hourlyrate }}</li>
          <li class="list-group-item">
            Órák száma: {{ project.numberofhours }}
          </li>
          <li class="list-group-item">{{ project.highschoolstudent }}</li>
        </ul>
        <!-- <div class="card-body">
          <button type="button" class="btn btn-sm btn-outline-primary m-2" @click="onClickEdit(project.id)"><i class="bi bi-pencil"></i></button>
            <button type="button" class="btn btn-sm btn-outline-danger m-1" @click="onClickDelete(project.id)"><i class="bi bi-trash"></i></button>
        </div> -->
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
      projects: [],
    };
  },
  mounted() {
    this.getProjects();
  },
  methods: {
    async getProjects() {
      let url = this.storeUrl.urlProjects;
      console.log(url);
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.projects = data.data;
    },
  },
};
</script>


<style>
.card {
  background-color: thistle;
}
.felirat {
  text-align: center;
  vertical-align: middle;
  background-color: thistle;
  font-family: Georgia, "Times New Roman", Times, serif;
}
</style>
