<template>
  <div class="main-container" id="container">
    <!--  BEGIN CONTENT AREA  -->

    <div id="content" class="main-content">
      <div class="layout-px-spacing">
        <div class="row layout-top-spacing">
          <div id="tableProgress" class="col-lg-12 col-12 layout-spacing">
            <div
              class="statbox widget box box-shadow"
              v-if="isShowEdit == false && isShowAdd == false"
            >
              <div class="row">
                <div
                  class="col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center"
                >
                  <a type="submit" class="btn btn-success mt-3" v-on:click.prevent="onAdd"
                    >Thêm Mới<svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-plus"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
                      /></svg
                  ></a>
                </div>

                <div
                  class="col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3"
                >
                  <div id="range-search_filter" class="dataTables_filter">
                    <label
                      ><svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="feather feather-search"
                        style="
                          position: absolute;

                          top: 11px;

                          right: 27px;

                          width: 20px;

                          color: #d3d3d3;
                        "
                      >
                        <circle cx="11" cy="11" r="8"></circle>

                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg
                      ><input
                        type="search"
                        class="form-control"
                        placeholder="Search..."
                        v-model="query"
                        aria-controls="range-search"
                    /></label>
                  </div>
                </div>
              </div>

              <div class="widget-header">
                <div class="row">
                  <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Quản Lý BLog</h4>
                  </div>
                </div>
              </div>

              <div class="widget-content widget-content-area">
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th class="text-center">Mã</th>

                        <th>Tên</th>

                        <th>Mô Tả</th>

                        <th>Ảnh</th>

                        <th>Trạng Thái</th>

                        <th class="text-center">Hành Động</th>
                      </tr>
                    </thead>

                    <tbody v-if="query">
                      <tr v-for="item in blogFilte" :key="item.id">
                        <td class="text-center">{{ item.code }}</td>

                        <td>{{ item.name }}</td>

                        <td>{{ item.description }}</td>

                        <td>
                          <img
                            :src="
                              'http://localhost:8080/Oganic_Fruit/assets/' + item.images
                            "
                            alt=""
                            style="width: 100px"
                          />
                        </td>

                        <td>
                          <p class="text-danger">
                            <span v-if="item.status">Hiển Thị</span>

                            <span v-if="!item.status">Ẩn</span>
                          </p>
                        </td>

                        <td class="text-center">
                          <a
                            href="javascript:void(0);"
                            data-toggle="tooltip"
                            data-placement="top"
                            title=""
                            data-original-title="Edit"
                            style="padding: 20px"
                            v-on:click="onEdit(item)"
                            ><svg
                              xmlns="http://www.w3.org/2000/svg"
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              stroke-width="2"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              class="feather feather-edit-2"
                            >
                              <path
                                d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"
                              ></path></svg
                          ></a>

                          <a
                            href="javascript:void(0);"
                            data-toggle="tooltip"
                            v-on:click.stop.prevent="onDelete(item)"
                            data-placement="top"
                            title=""
                            data-original-title="Delete"
                            ><svg
                              xmlns="http://www.w3.org/2000/svg"
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              stroke-width="2"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              class="feather feather-trash-2"
                            >
                              <polyline points="3 6 5 6 21 6"></polyline>

                              <path
                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                              ></path>

                              <line x1="10" y1="11" x2="10" y2="17"></line>

                              <line x1="14" y1="11" x2="14" y2="17"></line></svg
                          ></a>
                        </td>
                      </tr>
                    </tbody>

                    <tbody v-else>
                      <tr v-for="item in blog" :key="item.id">
                        <td class="text-center">{{ item.code }}</td>

                        <td>{{ item.name }}</td>

                        <td>{{ item.description }}</td>

                        <td>
                          <img
                            :src="
                              'http://localhost:8080/Oganic_Fruit/assets/' + item.images
                            "
                            alt=""
                            style="width: 100px"
                          />
                        </td>

                        <td>
                          <p class="text-danger">
                            <span v-if="item.status">Hiển Thị</span>

                            <span v-if="!item.status">Ẩn</span>
                          </p>
                        </td>

                        <td class="text-center">
                          <a
                            href="javascript:void(0);"
                            data-toggle="tooltip"
                            data-placement="top"
                            title=""
                            data-original-title="Edit"
                            style="padding: 20px"
                            v-on:click="onEdit(item)"
                            ><svg
                              xmlns="http://www.w3.org/2000/svg"
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              stroke-width="2"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              class="feather feather-edit-2"
                            >
                              <path
                                d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"
                              ></path></svg
                          ></a>

                          <a
                            href="javascript:void(0);"
                            data-toggle="tooltip"
                            v-on:click.stop.prevent="onDelete(item)"
                            data-placement="top"
                            title=""
                            data-original-title="Delete"
                            ><svg
                              xmlns="http://www.w3.org/2000/svg"
                              width="24"
                              height="24"
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              stroke-width="2"
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              class="feather feather-trash-2"
                            >
                              <polyline points="3 6 5 6 21 6"></polyline>

                              <path
                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"
                              ></path>

                              <line x1="10" y1="11" x2="10" y2="17"></line>

                              <line x1="14" y1="11" x2="14" y2="17"></line></svg
                          ></a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <a
              href=""
              v-if="isShowEdit == true || isShowAdd == true"
              v-on:click.prevent="back_to"
              ><svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                style="width: 32px; height: 32px"
                height="16"
                fill="currentColor"
                class="bi bi-arrow-left-circle-fill"
                viewBox="0 0 16 16"
              >
                <path
                  d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"
                /></svg
            ></a>

            <blogEdit
              :blog="showEdit"
              v-if="isShowEdit == true"
              @ShowEditData="getEdit($event)"
            />

            <BlogAdd v-if="isShowAdd == true" @ShowData="getData($event)" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style></style>
<script>
import BlogService from "../../services/BlogService";
import BlogEdit from "../Blog/edit.vue";
import BlogAdd from "../Blog/add.vue";
export default {
  name: "Index",
  components: {
    BlogEdit,
    BlogAdd,
  },
  data() {
    return {
      blog: null,
      showEdit: null,
      isShowEdit: false,
      isShowAdd: false,
      query: "",
    };
  },
  mounted() {
    BlogService.getAll()
      .then((res) => {
        this.blog = res.data;
        console.log(this.blog);
      })
      .catch((error) => {
        console.log(error);
      })
      .finally(() => {
        //Perform action in always
      });
  },
  computed: {
    blogFilte() {
      if (this.query) {
        return this.blog.filter((blog) => {
          return blog.name.toLowerCase().indexOf(this.query.toLowerCase()) != -1;
        });
      } else {
        return this.blog;
      }
    },
  },
  methods: {
    onEdit(data) {
      this.showEdit = data;
      this.isShowEdit = true;
      console.log(data);
    },
    back_to() {
      (this.isShowEdit = false), (this.isShowAdd = false);
    },
    onAdd() {
      this.isShowAdd = true;
    },
    getData(data) {
      this.blog.push(data);
      console.log(data);
      this.isShowAdd = false;
      this.$forceUpdate();
    },
    getEdit(data) {
      for (let i = 0; i < this.blog.length; i++) {
        if (this.blog[i].id == data.id) {
          this.blog[i] = data;
          this.$forceUpdate();
          break;
        }
      }

      console.log(this.blog);
      this.isShowEdit = false;
    },
    onDelete(item) {
      if (confirm("Bạn có chắc muốn xóa blog số " + item.id)) {
        BlogService.delete(item.id)
          .then((response) => {
            console.log(response);
            this.blog
              .splice(
                this.blog.findIndex((e) => e.id == item.id),
                1
              )
              .push(response.data);
          })
          .catch(function (error) {
            console.log(error);
          });
      }
    },
  },
};
</script>
