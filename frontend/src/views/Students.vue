
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
        id="modalCar"
        tabindex="-1"
        aria-labelledby="modalCarModalLabel"
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
                <!-- Autó név -->
                <div class="col-md-12">
                  <label for="name" class="form-label">Autó név</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    required
                    v-model="editableCar.name"
                  />
                  <div class="invalid-feedback">A név kitöltése kötelező</div>
                </div>

                <!-- Rendszám -->
                <div class="col-md-6">
                  <label for="licenceNumber" class="form-label">Rendszám</label>
                  <input
                    type="text"
                    class="form-control"
                    id="licenceNumber"
                    required
                    v-model="editableCar.licenceNumber"
                  />
                  <div class="invalid-feedback">
                    A rendszám kitöltése kötelező
                  </div>
                </div>

                <!-- Rendszám -->
                <div class="col-md-6">
                  <label for="hourlyRate" class="form-label"
                    >Tarifa (Ft/óra)</label
                  >
                  <input
                    type="number"
                    class="form-control"
                    id="hourlyRate"
                    required
                    v-model="editableCar.hourlyRate"
                  />
                  <div class="invalid-feedback">
                    A tarifa kitöltése kötelező
                  </div>
                </div>

                <!-- out of traffic -->
                <div class="col-md-6">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="outOfTraffic"
                    v-model="editableCar.outOfTraffic"
                  />
                  <label class="form-check-label ms-2" for="flexCheckDefault">
                    Forgalmon kívül
                  </label>
                </div>

                <div class="col-md-6">
                  <select
                    class="form-select"
                    aria-label="Default select example"
                    v-model="editableCar.driverId"
                  >
                    <option :value="null">Nincs sofőr</option>
                    <option
                      v-for="(driver, index) in driversAbc"
                      :key="`op${index}`"
                      :value="driver.id"
                    >
                      {{ driver.driverName }}
                    </option>
                  </select>
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
