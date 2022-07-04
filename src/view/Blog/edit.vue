<template>

    <div class="statbox widget box box-shadow">

        <div class="widget-header">
            <div class="row">
                <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                    <h4>Sửa blog</h4>
                </div>
            </div>
        </div>
        <div class="widget-content widget-content-area">
            <form method="post" enctype='multipart/form-data' v-on:submit.prevent="onSubmitEditForm" v-if="blogs">
                <input type="hidden" v-model="blogs.id">
                <div class="form-group row mb-4">
                    <label for="exampleFormControlInput1" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="code" placeholder="" v-model="blogs.code" />
                    </div>

                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên
                        blogs</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <input type="text" class="form-control" id="name" placeholder="" v-model="blogs.name">
                    </div>
                </div>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mô Tả</label>
                    <div class="col-xl-6 col-lg-6 col-sm-6">
                        <textarea class="form-control mb-4" rows="3" id="textarea-copy"
                            v-model="blogs.description"></textarea>
                    </div>
                </div>
                <fieldset class="form-group mb-4">
                    <div class="row">
                        <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                            Thái</label>
                        <div class="col-xl-10 col-lg-9 col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="blogs.status" :value="true" :checked="blogs.status === true"
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" v-model="blogs.status" :value="false" :checked="blogs.status === false || blogs.status === '' "
                                    id="status" style="width: 16px;height: 16px;" />
                                <label class="form-check-label" for="flexCheckChecked"> Ẩn </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mb-4">
                    <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">
                        Ảnh</label>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <input type="file" class="custom-file-container__custom-file__custom-file-input"
                            accept="Images/*" ref="images" id="images" @change="handleFileUpload()">

                    </div>
                    <div class="col-xl-10 col-lg-9 col-sm-10">
                        <img :src="'http://localhost:8080/Oganic_Fruit/assets/' + blogs.images"
                            style="width: 600px;height: 500px;margin-left: 20%;" v-if="ishowImage == false" />
                        <img v-bind:src="url" style="width: 600px;height: 500px;margin-left: 20%;"
                            v-if="ishowImage == true" />
                    </div>

                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary mt-3">Lưu</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</template>
<script>
import BlogService from "../../services/BlogService";
import UploadService from "../../services/UploadService";
export default {
    props: ['blog'],
    data() {
        return {
            message: "",
            currentImage: undefined,
            url: null,
            blogs: this.blog,
            ishowImage: false,
            old: "localhost:8080/uploads/" + this.blog.images,

        }
    },
    methods: {
        onSubmitEditForm() {
           UploadService.upload(this.currentImage)
                .then((response) => {
                    console.log();
                    this.message = response.data.message;
                })
                .catch((err) => {
                    this.message = "Không thể tải ảnh ! " + err;
                    this.currentImage = undefined;
                });
            BlogService.update(this.blogs)
                .then((res) => {
                    //Perform Success Action
                    this.blogs = res.data;
                    res.data.files;
                    console.log(res);
                })
                .catch((error) => {
                    // error.response.status Check status code
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
            this.$emit("ShowEditData", this.blogs);
        },
        selectImage() {
            this.currentImage = this.$refs.file.files.item(0);
            this.url = URL.createObjectURL(this.currentImage);
            this.banners.images = this.$refs.file.files.item(0).name;
            this.ishowImage = true;
        },
    }

}
</script>
