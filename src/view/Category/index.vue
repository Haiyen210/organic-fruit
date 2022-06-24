<template>
    <div class="main-container" id="container">

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">
                    <div id="tableProgress" class="col-lg-12 col-12 layout-spacing">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        <h4>Quản Lý Category</h4>
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
                                                <th>Mô tả</th>
                                                <th>Trạng Thái</th>
                                                <th class="text-center">Hành Động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in category" :key="item.id">
                                                <td class="text-center">{{item.code}}</td>
                                                <td>{{item.name}}</td>
                                                <td>
                                                   {{item.description}}
                                                </td>
                                                <td>
                                                    <p class="text-danger">{{item.Status == true ? 'Hiển Thị' : 'Ẩn'}}</p>
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:void(0);" data-toggle="tooltip"
                                                        data-placement="top" title="" data-original-title="Edit"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="feather feather-edit-2">
                                                            <path
                                                                d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z">
                                                            </path>
                                                        </svg></a><a href="javascript:void(0);" data-toggle="tooltip"
                                                        data-placement="top" title="" data-original-title="Delete"><svg
                                                            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                            stroke-width="2" stroke-linecap="round"
                                                            stroke-linejoin="round" class="feather feather-trash-2">
                                                            <polyline points="3 6 5 6 21 6"></polyline>
                                                            <path
                                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                            </path>
                                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                                        </svg></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios';
export default {
    data() {
        return {
            category: null,
        }
    },
    mounted() {
        axios.get("http://localhost:8080/Oganic_Fruit/rest/categoryService/getListCategory")
            .then((res) => {
                this.category = res.data;
                console.log(this.category);
            })
            .catch((error) => {
                console.log(error);
            })
            .finally(() => {
                //Perform action in always
            });
    }

}
</script>