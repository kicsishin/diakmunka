
<template>
  <div>
    <h1>Students</h1>
    <!-- tablazat -->
    <div>
      <table class="table w-auto">
        <thead>
          <tr>
            <th scope="col">
              <button
                type="button"
                class="btn btn-sm btn-outline-success"
                @click="onClickNew()"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
              >
                New
              </button>
            </th>
            <th scope="col">Name</th>
            <th scope="col">Date Time</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(student, index) in students" :key="`student${index}`">
            <td>
              <button
                type="button"
                class="btn btn-sm btn-outline-primary m-2"
                @click="onClickEdit(student.id)"
              >
                <i class="bi bi-pencil"></i>
              </button>
              <button
                type="button"
                class="btn btn-sm btn-outline-danger m-1"
                @click="onClickDelete(student.id)"
              >
                <i class="bi bi-trash"></i>
              </button>
            </td>
            <td>{{ student.name }}</td>
            <td>{{ student.datetime }}</td>
          </tr>
        </tbody>
      </table>
      <!-- modal -->
      <!-- Button trigger modal -->
      <!-- <button type="button" class="btn btn-primary" >
  Launch demo modal
</button> -->
      <div
        class="modal fade"
        id="modalStudent"
        tabindex="-1"
        aria-labelledby="modalStudentModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">
                {{ stateTitle }}
              </h1>
              <button
                type="button"
                class="btn-close"
                @click="onClickCancel()"
                aria-label="Close"
              ></button>
            </div>

            <!--#region Modal body -->
            <div class="modal-body">
              <!--#region Form -->

              <form class="row g-3 needs-validation" novalidate>
                <div class="col-md-12">
                  <label for="name" class="form-label">Student name</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    required
                    v-model="editableStudent.name"
                  />
                  <div class="invalid-feedback">A név kitöltése kötelező</div>
                </div>

                <div class="col-md-6">
                  <label for="datetime" class="form-label">Datetime</label>
                  <input
                    type="date"
                    class="form-control"
                    id="datetime"
                    required
                    v-model="editableStudent.datetime"
                  />
                  <div class="invalid-feedback">
                    A szuletesi datum kitöltése kötelező
                  </div>
                </div>
              </form>
              <!--#endregion Form -->
            </div>
            <!--#endregion Modal body -->

            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                @click="onClickCancel()"
              >
                Close
              </button>
              <button
                type="button"
                class="btn btn-primary"
                @click="onClickSave()"
              >
                Save changes
              </button>
            </div>
          </div>
        </div>
      </div>
      <!--#endregion Modal -->
    </div>
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class Student {
  constructor(id = 0, name = null, datetime = null) {
    this.id = id;
    this.name = name;
    this.datetime = datetime;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      students: [],
      editableStudent: new Student(),
      modal: null,
      form: null,
      state: "view",
      currentId: null,
      studentsABC: [],
    };
  },
  mounted() {
    this.getStudents();
    this.getFreeStudentsAbc();
    this.modal = new bootstrap.Modal(
      document.getElementById("modalStudent"),
      {
        keyboard: false,
      }
    );
    this.form = document.querySelector(".needs-validation");
  },
  methods: {
    async getStudents() {
      let url = this.storeUrl.urlStudents;
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

    async getStudentById(id) {
      let url = `${this.storeUrl.urlStudents}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableStudent = data.data;
    },
    async postStudent() {
      let url = this.storeUrl.urlStudents;
      const body = JSON.stringify(this.editableStudent);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getStudents();
    },
    async putStudent() {
      const id = this.editableStudent.id;
      let url = `${this.storeUrl.urlStudents}/${id}`;
      const body = JSON.stringify(this.editableStudent);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getStudents();
    },
    async getFreeStudentsAbc() {
      let url = this.storeUrl.urlFreeStudentsAbc;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.studentsABC = data.data;
    },

    async deleteStudent(id) {
      let url = `${this.storeUrl.urlStudents}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getStudents();
    },
    onClikRow(id) {
      this.currentId = id;
    },
    onClickNew() {
      this.state = "new";
      this.editableStudent = new Student();
      this.getStudents();
      this.modal.show();
    },
    onClickDelete(id) {
      let text = "Biztosan Törölni akarja?";
      if (confirm(text) == true) {
        text = "Törölve!";
      }else{
        text = "Visszavonva!";
      }
      this.state = "delete";
      this.deleteStudent(id);

    },
    onClickEdit(id) {
      this.state = "edit";
      this.getStudentById(id);
      this.getFreeStudentsAbc();
      this.modal.show();
    },
    onClickCancel() {
      this.editableStudent = new Student();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          //put
          this.putStudent();
          // this.modal.hide();
        } else if (this.state == "new") {
          //post
          this.postStudent();
          // this.modal.hide();
        }
        this.modal.hide();
        //frissíti a taxisok listáját
        this.getFreeStudentsAbc();
      }
    },
    currentRowBackground(id) {
      return this.currentId == id ? "my-bg-current-row" : "";
    },
    // outOfTrafficName(outOfTraffic) {
    //   return outOfTraffic ? "igen" : "nem";
    // },
  },

  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "Új Diak bevitele";
      } else if (this.state === "edit") {
        return "Diak módosítása";
      }
    },
  },
};
</script>


<style>
th,
td {
  text-align: center;
  vertical-align: middle;
  font-family: Georgia, "Times New Roman", Times, serif;
}
h1,
table {
  font-family: Georgia, "Times New Roman", Times, serif;
  text-align: center;
  background-color: antiquewhite;
}
</style>
