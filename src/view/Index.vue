<template>
    <div class="index">
        <nav-header></nav-header>
        <jumbotron />
        <color-palette />
        <gradient-box :gradientData=gradientData :originGradientData=originGradientData />
        <color-card :colorCard=colorCardData />
        <nav-bottom />
    </div>
</template>
<script>
import NavHeader from '@/components/NavHeader'
import Jumbotron from '@/components/Jumbotron'
import GradientBox from '@/components/GradientBox'
import ColorCard from '@/components/ColorCard'
import NavBottom from '@/components/NavBottom'
import ColorPalette from '@/components/ColorPalette'
export default {
    components: {
        ColorPalette,
        NavBottom,
        ColorCard,
        GradientBox,
        Jumbotron,
        NavHeader,
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
            colorCardData: [],
            originColorCardData: []
        }
    },
    mounted() {
        this.test()
        this.getGradientData()
    },
    methods: {
        test() {
            console.log($('btn'))
        },
        async getGradientData() {
            // const gradientData = await this.$axios.get('/colorrgba/getIndexData')
            // console.log(gradientData)
            const result = await this.$axios.get('/colorrgba/getIndexData')
                
            const { gradient, colorCard } = result.data
            // console.log(gradient)
            // console.log(colorCard)
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

            // 处理colorcard  colorList start
            colorCard.forEach(item => {
                item.colorList = item.colorList.split(' ')
            })
            this.colorCardData = colorCard
            // 处理colorcard  colorList end
            
            this.originColorCardData = colorCard
            console.log(this.colorCardData)
                
        }
        
    }
}
</script>
<style lang="scss" scoped>
.index {
    
}
</style>
