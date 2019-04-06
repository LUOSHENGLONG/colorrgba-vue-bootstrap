<template>
    <div class="gradient">
        <nav-header />
        
        <div class="container">
            <header-title :title="'Color Card'" :isFloat=false :isMore="false" :isSwitch=true @SwitchGrid="switchGrid(isCircle)" ></header-title>
            <color-card 
                :isIndex=false 
                :colorCard=colorCardData
                :isCircle=isCircle
                :originColorCard=originColorCardData />
            <pagination 
                :paginationArgs=paginationArgs
                @handleSize=handleSize
                @handleCurrent=handleCurrent />
        </div>
        <nav-bottom />
    </div>
</template>
<script>
import NavHeader from '@/components/NavHeader'
import NavBottom from '@/components/NavBottom'
import HeaderTitle from '@/components/HeaderTitle';
import ColorCard from '@/components/ColorCard'
import Pagination from '@/components/Pagination'
export default {
    components: {
        NavHeader,
        NavBottom,
        HeaderTitle,
        ColorCard,
        Pagination
    },
    data() {
        return {
            colorCardData: [
               
            ],
            originColorCardData: [
                
            ],
            paginationArgs: {
                page_sizes: [6,12,18],
                page_size: 12,
                layout: "total, sizes, prev, pager, next, jumper",
                total: 0,
                current_page: 1
            },
            isCircle: true
        }
    },
    beforeMount() {
        this.getColorCardData()
    },
    methods: {
        async getColorCardData() {
            const result = await this.$axios.get('/colorrgba/getColorCardData',
            {
                params: {
                    current_page: parseInt(this.paginationArgs.current_page),
                    page_size: parseInt(this.paginationArgs.page_size)
                }
            })

            const { colorCard, totalCount } = result.data
            this.paginationArgs.total = parseInt(totalCount)
            // 处理colorcard  colorList start
            colorCard.forEach(item => {
                item.colorList = item.colorList.split(' ')
            })
            this.colorCardData = colorCard
            // 处理colorcard  colorList end
            this.originColorCardData = colorCard
            // console.log(this.colorCardData)
            window.scrollTo(0,0)
        },
        // 处理分页大小
        handleSize(size) {
            // console.log(size)
            this.paginationArgs.page_size = size

            this.$router.push(
                {
                    path: `color`,
                    query: {
                        current_page: size,
                        page_size: this.paginationArgs.page_size,
                    }
                })

        },
        // 处理分页换页
        handleCurrent(current_page) {
            // console.log(current_page)
            this.paginationArgs.current_page = current_page
            this.$router.push(
                {
                    path: `color`,
                    query: {
                        current_page: current_page,
                        page_size: this.paginationArgs.page_size,
                    }
                })
            
        },
        switchGrid(Circle) {
            this.isCircle = !this.isCircle
        }
    },
    watch: {
      // 监听路由变化，随时获取新的列表信息
      '$route': 'getColorCardData'
    }
}
</script>
<style lang="scss" scoped>

</style>
