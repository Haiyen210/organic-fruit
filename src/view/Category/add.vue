<template>
    <div class="main-container" id="container">

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">
                    <div id="flHorizontalForm" class="col-lg-12 layout-spacing">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        <h4>Thêm Mới Category</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content widget-content-area">
                                <form method="post" enctype="multipart/form-data" v-on:submit.prevent="onSubmitForm">
                                    <div class="form-group row mb-4">
                                        <label for="exampleFormControlInput1"
                                            class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mã</label>
                                        <div class="col-xl-6 col-lg-6 col-sm-6">
                                            <input type="text" class="form-control" id="code" placeholder=""
                                                v-model="category.code" />
                                        </div>

                                    </div>
                                    <div class="form-group row mb-4">
                                        <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Tên
                                            category</label>
                                        <div class="col-xl-6 col-lg-6 col-sm-6">
                                            <input type="text" class="form-control" id="name" placeholder=""
                                                v-model="category.name">
                                        </div>
                                    </div>
                                    <div class="form-group row mb-4">
                                        <label for="hPassword" class="col-xl-2 col-sm-3 col-sm-2 col-form-label">Mô tả</label>
                                        <div class="col-xl-6 col-lg-6 col-sm-6">
                                            <input type="text" class="form-control" id="name" placeholder=""
                                                v-model="category.description">
                                        </div>
                                    </div>
                                    <fieldset class="form-group mb-4">
                                        <div class="row">
                                            <label class="col-form-label col-xl-2 col-sm-3 col-sm-2 pt-0">Trạng
                                                Thái</label>
                                            <div class="col-xl-10 col-lg-9 col-sm-10">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="true"
                                                        v-model="category.status" id="status"
                                                        style="width: 16px;height: 16px;" checked/>
                                                    <label class="form-check-label" for="flexCheckDefault"> Hiển Thị
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" value="false" 
                                                        v-model="category.status" id="status"
                                                        style="width: 16px;height: 16px;" />
                                                    <label class="form-check-label" for="flexCheckChecked"> Ẩn </label>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="form-group row">
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary mt-3">Lưu</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from "axios";
export default {
    data() {
        return {
            category: {
                code: "",
                name: "",
                description: "",
                status: ""
            },
        }

    },
    methods: {
        // click thêm dữ liệu
        onSubmitForm() {
            //append file ảnh vào forder Images
            
            //Cái này là dùng ajax để đẩy dữ liệu lên vs method post
            axios
                .post("http://localhost:8080/Oganic_Fruit/rest/categoryService/insertCategory",this.category )
                .then((res) => {
                    //Perform Success Action
                    this.category = res.data;
                    console.log(res);
                    console.log(res.data);
                })
                .catch((error) => {
                    // error.response.status Check status code
                    console.log(error);
                })
                .finally(() => {
                    //Perform action in always
                });
        },
        
    }

}
</script>
// khi click thêm dữ liệu vào thì sẽ đc append cái file upload nên mới nhét cái formData ở trong hàm onSubmitForm