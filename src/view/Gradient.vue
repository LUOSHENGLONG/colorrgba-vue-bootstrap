<template>
    <div class="gradient">
        <nav-header />
        
        <div class="container">
            <header-title :title="'Gradient'" :isFloat=false :isMore="false" ></header-title>
            <gradient-box 
                :isIndex=false 
                :gradientData=gradientData 
                :originGradientData=originGradientData
                />
            <pagination 
                :paginationArgs=paginationArgs
                @handleSize=handleSize
                @handleCurrent=handleCurrent  />
        </div>
        <nav-bottom />
    </div>
</template>
<script>
import NavHeader from '@/components/NavHeader'
import NavBottom from '@/components/NavBottom'
import HeaderTitle from '@/components/HeaderTitle';
import GradientBox from '@/components/GradientBox'
import Pagination from '@/components/Pagination'
export default {
    components: {
        NavHeader,
        NavBottom,
        HeaderTitle,
        GradientBox,
        Pagination
    },
    data() {
        return {
            gradientData: [
                {
                    rotate: 140,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 20},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 60,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'white', degree: 50},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 66,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'black', degree: 20},
                        {color: 'green', degree: 30},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 99,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'green', degree: 20},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 140,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 50},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 111,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 100},
                    ]
                },
                {
                    rotate: 99,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'green', degree: 20},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 140,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 50},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 111,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 100},
                    ]
                }
                
            ],
            originGradientData: [
                {
                    rotate: 140,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 20},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 60,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'white', degree: 50},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 66,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'black', degree: 20},
                        {color: 'green', degree: 30},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 99,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'green', degree: 20},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 140,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 50},
                        {color: 'red', degree: 100},
                    ]
                },
                {
                    rotate: 111,
                    colorList: [
                        {color: 'blue', degree: 0},
                        {color: 'pink', degree: 100},
                    ]
                }
                
            ],
            paginationArgs: {
                page_sizes: [6,12,18],
                page_size: 12,
                layout: "total, sizes, prev, pager, next, jumper",
                total: 0,
                current_page: 1
            }
        }   
    },
    mounted() {
        this.getGradientData()
    },
    methods: {
        async getGradientData() {
            const result = await this.$axios.get('/colorrgba/getGradientData',
            {
                params: {
                    current_page: parseInt(this.paginationArgs.current_page),
                    page_size: parseInt(this.paginationArgs.page_size)
                }
            })
            const { gradient, totalCount } = result.data
            // console.log(totalCount)
            this.paginationArgs.total = parseInt(totalCount)
            // 处理渐变色colorList start
            gradient.forEach((item, index) => {
                // console.log(item.colorList.split(' '))
                // colorList 数据为 字符串  blue 0 red 60 purple 90 pink 100 要转化为[{color: 'blue',degree: 0},{color: 'pink',degree: 100}]
                let colorarr = item.colorList.split(' ')
                let arr = []
                for(let i = 0; i < colorarr.length; i =i+2) {
                    let obj = {
                        color: colorarr[i],
                        degree: parseInt(colorarr[i+1])
                    }
                    arr.push(obj)
                }
                item.colorList = arr
            })
            // 设置渐变颜色
            this.gradientData = gradient
            this.originGradientData = gradient
            // 处理渐变色colorList end
            // console.log(gradient)
            // console.log('ok')
            window.scrollTo(0,0)
            
        },
        // 处理分页大小
        handleSize(size) {
            // console.log(size)
            this.paginationArgs.page_size = size

            this.$router.push(
                {
                    path: `gradient`,
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
                    path: `gradient`,
                    query: {
                        current_page: current_page,
                        page_size: this.paginationArgs.page_size,
                    }
                })
            
        },
    },
    watch: {
      // 监听路由变化，随时获取新的列表信息
      '$route': 'getGradientData'
    }
}
</script>
<style lang="scss" scoped>

</style>
