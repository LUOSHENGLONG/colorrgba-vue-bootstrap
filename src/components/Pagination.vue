<template>
    <div class="pagination">
          <div class="block">
            <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="paginationArgs.current_page"
            :page-sizes="paginationArgs.page_sizes"
            :page-size="paginationArgs.page_size"
            :layout="paginationArgs.layout"
            :total="paginationArgs.total">
            </el-pagination>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        paginationArgs: Object,
        default: {}
    },
    methods: {
        handleSizeChange(val) {
            console.log(val)
            this.$emit('handleSize', val)
        },
        handleCurrentChange(val) {
            console.log(val)
            this.$emit('handleCurrent', val)
        }
    },
    data() {
        return {
            
        };
    }
}
</script>
<style lang="scss" scoped>
.pagination {
    width: 100%;
    margin: 60px 0;
    text-align: center;
    .block {
        width: 100%;
        text-align: center;
    }
}
</style>
