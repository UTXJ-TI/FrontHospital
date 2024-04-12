<template>
  <div class="container-fluid">
    <b-row>
      <b-col sm="12" lg="12">
        <iq-card class="iq-card">
          <template v-slot:headerTitle>
            <b-card-title>{{ $t("sidebar.verticalWizard") }}</b-card-title>
          </template>
          <template v-slot:body>
            <b-row>
              <b-col md="3">
                <ul id="top-tabbar-vertical" class="p-0">
                  <li
                    class="active"
                    :class="`${currentindex == 1 ? 'active' : ''} ${
                      currentindex > 1 ? 'done active' : ''
                    } `"
                    id="personal"
                  >
                    <a href="#personal" @click="changeTab(1)">
                      <i class="ri-account-box-fill text-primary"></i>
                      <span>Datos Personales</span>
                    </a>
                  </li>
                  <li
                    id="contactos"
                    :class="`${currentindex == 2 ? 'active' : ''} ${
                      currentindex > 2 ? 'done active' : ''
                    }`"
                  >
                    <a href="#contactos" @click="changeTab(2)">
                      <i class="ri-phone-fill text-danger"></i>
                      <span>Contactos</span>
                    </a>
                  </li>
                  <li
                    id="padecimiento_actual"
                    :class="`${currentindex == 3 ? 'active' : ''} ${
                      currentindex > 3 ? 'done active' : ''
                    }`"
                  >
                    <a href="#padecimiento_actual" @click="changeTab(3)">
                      <i class="ri-file-fill text-success"></i
                      ><span>Padecimiento Actual</span></a
                    >
                  </li>
                  <li
                    id="signos_vitales"
                    :class="`${currentindex == 4 ? 'active' : ''} ${
                      currentindex > 4 ? 'done active' : ''
                    }`"
                  >
                    <a href="#signos_vitales" @click="changeTab(4)">
                      <i class="ri-drop-fill text-warning"></i
                      ><span>Signos vitales</span></a
                    >
                  </li>
                  <li
                    id="notas_medicas"
                    :class="`${currentindex == 5 ? 'active' : ''} ${
                      currentindex > 5 ? 'done active' : ''
                    }`"
                  >
                    <a href="#notas_medicas" @click="changeTab(5)">
                      <i class="ri-bookmark-fill text-info"></i
                      ><span>Notas Medicas</span></a
                    >
                  </li>
                </ul>
              </b-col>
              <b-col md="9">
                <b-form id="form-wizard3" class="text-center">
                  <!-- fieldsets -->
                  <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-start">
                        <b-row>
                          <b-col>
                            <h3 class="mb-4">Datos personales:</h3>
                          </b-col>
                        </b-row>
                        <b-row>
                          <div class="col-sm-6 col-md-5 col-lg-6">
                            <!-- Izquierda -->
                            <div class="col-md-12">
                              <div class="form-group">
                                <label for="nombre" class="form-label mb-2"
                                  >Nombre:</label
                                >
                                <input
                                  type="text"
                                  class="form-control"
                                  id="nombre"
                                  name="nombre"
                                  placeholder="Nombre"
                                  v-model="nombre"
                                  @focus="validarNombre"
                                  :class="{
                                    'is-invalid':
                                      nombreInvalido && nombre.length === 0,
                                  }"
                                  pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+"
                                  title="Solo se acepta texto"
                                  required
                                />
                                <div class="invalid-feedback">
                                  Este campo es requerido
                                </div>
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label
                                  for="segundo_apellido"
                                  class="form-label mb-2"
                                  >Apellido materno:
                                </label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="segundo_apellido"
                                  name="segundo_apellido"
                                  placeholder="Apellido materno"
                                  v-model="segundo_apellido"
                                  @focus="validarApellidoM"
                                  :class="{
                                    'is-invalid':
                                      apellidoMInvalido &&
                                      segundo_apellido.length === 0,
                                  }"
                                  pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+"
                                  title="Solo se acepta texto"
                                  required
                                />
                                <div class="invalid-feedback">
                                  Este campo es requerido
                                </div>
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label for="dob" class="mb-2"
                                  >Fecha de nacimiento:</label
                                >
                                <input
                                  type="date"
                                  class="form-control"
                                  id="dob"
                                  name="dob"
                                  v-model="dob"
                                  @change="validateDate"
                                />
                                <small v-if="error" class="text-danger"
                                  >La fecha de nacimiento no es válida</small
                                >
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label for="ts" class="mb-2"
                                  >Tipo de Sangre:</label
                                >
                                <select
                                  class="custom-select form-select"
                                  id="ts"
                                  name="ts"
                                  v-model="selectedBloodType"
                                  @change="validateBloodType"
                                >
                                  <option value="" selected>
                                    Tipo de sangre...
                                  </option>
                                  <option value="1">A+</option>
                                  <option value="2">A-</option>
                                  <option value="3">B+</option>
                                  <option value="4">B-</option>
                                  <option value="5">AB+</option>
                                  <option value="6">AB-</option>
                                  <option value="7">O+</option>
                                  <option value="8">O-</option>
                                </select>
                                <div
                                  v-if="bloodTypeEmpty"
                                  class="invalid-feedback"
                                >
                                  Por favor, selecciona un tipo de sangre.
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- Columnas separador -->
                          <div
                            class="col-sm-6 col-md-5 offset-md-2 col-lg-6 offset-lg-0"
                          >
                            <!-- Derecha -->

                            <div class="col-md-12">
                              <div class="form-group">
                                <label
                                  for="primer_apellido"
                                  class="form-label mb-2"
                                  >Apellido paterno:
                                </label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="primer_apellido"
                                  name="primer_apellido"
                                  placeholder="Apellido paterno"
                                  v-model="primer_apellido"
                                  @focus="validarApellidoP"
                                  :class="{
                                    'is-invalid':
                                      apellidoPInvalido &&
                                      primer_apellido.length === 0,
                                  }"
                                  pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]+"
                                  title="Solo se acepta texto"
                                  required
                                />
                                <div class="invalid-feedback">
                                  Este campo es requerido
                                </div>
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label for="curp" class="form-label mb-2"
                                  >CURP:
                                </label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="curp"
                                  name="curp"
                                  placeholder="CURP"
                                  v-model="curp"
                                  @focus="validarCurp"
                                  :class="{
                                    'is-invalid':
                                      CurpInvalido && curp.length === 0,
                                  }"
                                  required
                                />
                                <div class="invalid-feedback">
                                  Este campo es requerido
                                </div>
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label for="alergias" class="form-label mb-2"
                                  >Alergias:
                                </label>
                                <input
                                  type="text"
                                  class="form-control"
                                  id="alergias"
                                  name="alergias"
                                  placeholder="Alergias"
                                  v-model="alergias"
                                  @focus="validarAlergias"
                                  :class="{
                                    'is-invalid':
                                      AlergiasInvalido && alergias.length === 0,
                                  }"
                                  required
                                />
                                <div class="invalid-feedback">
                                  Este campo es requerido
                                </div>
                              </div>
                            </div>

                            <div class="col-md-12">
                              <div class="form-group">
                                <label class="my-2">Genero: </label>
                                <div class="form-check d-flex ps-0">
                                  <div
                                    class="custom-control custom-radio custom-control-inline me-4"
                                  >
                                    <input
                                      type="radio"
                                      id="customRadio1"
                                      name="customRadio"
                                      class="custom-control-input"
                                    />
                                    <label
                                      class="custom-control-label"
                                      for="customRadio1"
                                    >
                                      Masculino</label
                                    >
                                  </div>
                                  <div
                                    class="custom-control custom-radio custom-control-inline"
                                  >
                                    <input
                                      type="radio"
                                      id="customRadio2"
                                      name="customRadio"
                                      class="custom-control-input"
                                    />
                                    <label
                                      class="custom-control-label"
                                      for="customRadio2"
                                    >
                                      Femenino</label
                                    >
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </b-row>
                      </div>

                      <a
                        href="#contactos"
                        class="btn btn-primary next action-button float-center"
                        @click="changeTab(2)"
                        value="siguiente"
                        >Siguiente</a
                      >
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <b-row>
                          <b-col>
                            <h3 class="mb-4">Contact Information:</h3>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <b-form-group label="Email ID : *">
                              <!-- <label for="email">Email Id: *</label> -->
                              <b-form-input
                                type="email"
                                class="form-control"
                                id="email"
                                name="email"
                                placeholder="Email Id"
                              />
                            </b-form-group>
                          </b-col>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ccno">Contact Number: </label>
                              <input
                                type="text"
                                class="form-control"
                                id="ccno"
                                name="ccno"
                                placeholder="Contact Number"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="city">City: </label>
                              <input
                                type="text"
                                class="form-control"
                                id="city"
                                name="city"
                                placeholder="City."
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="state">State: *</label>
                              <input
                                type="text"
                                class="form-control"
                                id="state"
                                name="state"
                                placeholder="State."
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                        </b-row>
                      </div>
                      <a
                        href="#padecimiento_actual"
                        @click="changeTab(3)"
                        class="btn btn-primary next action-button float-end"
                        value="Next"
                        >Next</a
                      >
                      <a
                        href="#personal"
                        @click="changeTab(1)"
                        class="btn btn-dark previous action-button-previous float-end me-1"
                        value="Previous"
                        >Previous</a
                      >
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 3 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <div class="row">
                          <div class="col-12">
                            <h3 class="mb-4">Padecimiento actual:</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="empid">Padecimiento: *</label>
                              <input
                                type="text"
                                class="form-control"
                                id="empid"
                                name="empid"
                                placeholder="Padecimiento actual"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="desg">Estatus: *</label>
                              <input
                                type="text"
                                class="form-control"
                                id="desg"
                                name="desg"
                                placeholder="Estatus."
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <a
                        href="#signos_vitales"
                        @click="changeTab(4)"
                        class="btn btn-primary next action-button float-end"
                        value="Next"
                        >Next</a
                      >
                      <a
                        href="#contactos"
                        @click="changeTab(2)"
                        class="btn btn-dark previous action-button-previous float-end me-1"
                        value="Previous"
                        >Previous</a
                      >
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 4 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <div class="row">
                          <div class="col-12">
                            <h3 class="mb-4 text-left">Signos vitales:</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="panno">Estatura: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="panno"
                                name="panno"
                                placeholder="Estatura"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="accno">Peso: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="accno"
                                name="accno"
                                placeholder="Peso"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="holname"
                                >Temperatura corporal: *</label
                              >
                              <input
                                type="number"
                                class="form-control"
                                id="holname"
                                name="accname"
                                placeholder="Temperatura corporal"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Presion sistolica: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Presion sistolica"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Presion diastolica: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Presion diastolica"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Oxigenacion: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Oxigenacion"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Frecuencia cardiaca: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Frecuencia cardiaca"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc"
                                >Frecuencia respiratoria: *</label
                              >
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Frecuencia respiratoria"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <a
                        href="#notas_medicas"
                        @click="changeTab(5)"
                        class="btn btn-primary next action-button float-end mt-3"
                        value="Siguiente"
                        >Siguiente</a
                      >
                      <a
                        href="#padecimiento_actual"
                        @click="changeTab(3)"
                        class="btn btn-dark previous action-button-previous float-end me-1"
                        value="Previous"
                        >Previous</a
                      >
                    </fieldset>
                  </div>
                  <div :class="`${currentindex == 5 ? 'show' : 'd-none'}`">
                    <fieldset>
                      <div class="form-card text-left">
                        <div class="row">
                          <div class="col-12">
                            <h3 class="mb-4 text-left">Notas medicas:</h3>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="panno">Estatura: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="panno"
                                name="panno"
                                placeholder="Estatura"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="accno">Peso: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="accno"
                                name="accno"
                                placeholder="Peso"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="holname"
                                >Temperatura corporal: *</label
                              >
                              <input
                                type="number"
                                class="form-control"
                                id="holname"
                                name="accname"
                                placeholder="Temperatura corporal"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Presion sistolica: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Presion sistolica"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Presion diastolica: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Presion diastolica"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Oxigenacion: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Oxigenacion"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc">Frecuencia cardiaca: *</label>
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Frecuencia cardiaca"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div class="form-group">
                              <label for="ifsc"
                                >Frecuencia respiratoria: *</label
                              >
                              <input
                                type="number"
                                class="form-control"
                                id="ifsc"
                                name="ifsc"
                                placeholder="Frecuencia respiratoria"
                                spellcheck="false"
                                data-ms-editor="true"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <a
                        href="#notas_medicas"
                        @click="changeTab(5)"
                        class="btn btn-primary submit action-button float-end mt-3"
                        value="Enviar"
                        >Enviar</a
                      >
                      <a
                        href="#signos_vitales"
                        @click="changeTab(4)"
                        class="btn btn-dark previous action-button-previous float-end me-1"
                        value="Previous"
                        >Previous</a
                      >
                    </fieldset>
                  </div>
                </b-form>
              </b-col>
            </b-row>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </div>
</template>
<script>
import iqCard from "../../components/xray/cards/iq-card";
export default {
  name: "VerticalWizard",
  components: { iqCard },
  data() {
    return {
      currentindex: 1,

      nombre: "",
      nombreInvalido: false,

      segundo_apellido: "",
      apellidoMInvalido: false,

      dob: "",
      error: false,

      selectedBloodType: "",
      bloodTypeEmpty: false,

      primer_apellido: "",
      apellidoPInvalido: false,

      curp: "",
      CurpInvalido: false,

      alergias: "",
      AlergiasInvalido: false,
    };
  },
  methods: {
    changeTab(val) {
      this.currentindex = val;
    },
    validarNombre() {
      this.nombreInvalido = this.nombre.length === 0;
    },
    validarApellidoM() {
      this.apellidoMInvalido = this.segundo_apellido.length === 0;
    },
    validateDate() {
      const inputDate = new Date(this.dob);
      const currentDate = new Date();
      if (isNaN(inputDate) || inputDate > currentDate) {
        this.error = true;
      } else {
        this.error = false;
      }
    },
    validateBloodType() {
      this.bloodTypeEmpty = this.selectedBloodType === "";
    },

    validarApellidoP() {
      this.apellidoPInvalido = this.primer_apellido.length === 0;
    },
    validarCurp() {
      this.CurpInvalido = this.curp.length === 0;
    },
    validarAlergias() {
      this.AlergiasInvalido = this.alergias.length === 0;
    },
  },
};
</script>
