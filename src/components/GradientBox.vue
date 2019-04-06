<template>
    <div class="container">
        <header-title v-if="isIndex" :title="'Gradient'" :link="'/gradient'" ></header-title>
        <div class="gradient-box">
            <div class="row" v-for="(row, rowIndex) in Math.ceil(gradientData.length/limit)" :key="rowIndex">
                <div class="col-sm-6 col-md-4" v-for="(item, i) in gradientData.slice(rowIndex*limit,row*limit)" :key="i">
                    <div class="thumbnail" >
                        <div class="gradient" :style="background(i+rowIndex*limit)">
                            <img src="" alt="">
                            <div class="copycss">
                                <vue-star animate="animated bounceIn" color="#F05654">
                                    <i slot="icon" class="">
                                    <img class="love" src="@/assets/svg/love.svg" alt="">
                                    </i>
                                </vue-star>

                                <!-- <i class="glyphicon glyphicon-paperclip"></i> -->
                                <!-- <span @click="copyCssClick(i+rowIndex*limit)">Copy Css</span> -->
                            </div>
                            <div class="reset">
                                <span @click="reset(i+rowIndex*limit)">Reset</span>
                                <i class="glyphicon glyphicon-repeat"  @click="reset(i+rowIndex*limit)"></i>
                            </div>
                        </div>
                        <div class="caption">
                            <!-- <h3>{{rowIndex*limit}} {{row*limit}}</h3> -->
                            <div class="mini">
                                <div class="copy" >
                                    <span ref="tqm" class="css-value" :id="'copyCss'+(i+rowIndex*limit)" v-text="background(i+rowIndex*limit)"></span>
                                    
                                    <button 
                                        @click="copyCssClick(i+rowIndex*limit)"
                                        @mouseover="copyCss(i+rowIndex*limit)"
                                        id="btnTips1" type="button" 
                                        class="copyCss btn" 
                                        data-toggle="popover" 
                                        title="" data-content="已复制"
                                        ref="btnTips1"
                                        :data-clipboard-target="'#copyCss'+(i+rowIndex*limit)"
                                        style="padding-left:0px;"
                                    >
                                        <i class="glyphicon glyphicon-paperclip"></i>
                                        <span>Copy Css</span>
                                    </button>
                                </div>
                                <div class="copyColor" >
                                    <span class="color-value" :id="'colorTarget'+(i+rowIndex*limit)" v-text="color(i+rowIndex*limit)"></span>
                                    
                                    <button 
                                        @click="copyColorClick(i+rowIndex*limit)"
                                        @mouseover="copyColor(i+rowIndex*limit)"
                                        id="btnTips2" type="button" 
                                        class="copyCss btn" 
                                        data-toggle="popover" 
                                        title="" data-content="已复制"
                                        ref="btnTips2"
                                        :data-clipboard-target="'#colorTarget'+(i+rowIndex*limit)"
                                        
                                    >
                                        <i class="glyphicon glyphicon-link"></i>
                                        <span>Copy Color</span>
                                    </button>
                                </div>
                                
                                <div class="show">
                                    <button class="btn" style="padding-right:0px;">
                                    <i class="glyphicon glyphicon-chevron-down" :ref="'show'+(i+rowIndex*limit)" @click="show(i+rowIndex*limit)"></i>
                                    <i class="glyphicon glyphicon-chevron-up" :ref="'hide'+(i+rowIndex*limit)" @click="hide(i+rowIndex*limit)"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="all-edit" :ref="'edit'+(i+rowIndex*limit)">
                                <div class="block">
                                    <button class="rorate-item rotate" :style="{transform:'rotate(' + item.rotate + 'deg)'}">
                                        
                                    </button>
                                    <span class="tips">{{item.rotate}}°</span>
                                    <el-slider
                                        class="rotateSlider"
                                        v-model="item.rotate"
                                        :max=360
                                        show-input
                                        >
                                    </el-slider>
                                    
                                </div>
                                <div class="colorList" v-for="(colorList, index) in gradientData[i+rowIndex*limit].colorList" :key="index">
                                    <button class="color-item" :style="{background: colorList.color}" :ref="'colorItem'+rowIndex+i+index" @click="selectNew(i+rowIndex*limit, index)"></button>
                                    <span class="tips">{{colorList.degree}}%</span>
                                    <div class="degreeSlider">
                                        <el-slider
                                            v-model="colorList.degree"
                                            :max=100
                                            show-input
                                            >
                                        </el-slider>
                                    </div>
                                    <div class="del">
                                        <i class="glyphicon glyphicon-remove" @click="del(i+rowIndex*limit, index)"></i>
                                    </div>
                                    <div class="picker" @mouseleave="close('picker'+(i+rowIndex*limit)+index)">
                                        <chrome-picker v-model="colors" @input="updateValue()" :ref="'picker'+(i+rowIndex*limit)+index" style="display:none;"></chrome-picker>
                                    </div>
                                </div>
                                <div class="edit">
                                    <div class="addColor">
                                        <i class="glyphicon glyphicon-plus" @click="addColor(i+rowIndex*limit)"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="error-tips" ref="errorTips">
            <div class="content">
                {{ errorTips }}
            </div>
        </div>
  </div>

</template>
<script>
import { Chrome } from 'vue-color'

import Clipboard from 'clipboard';
import VueStar from 'vue-star'
import HeaderTitle from '@/components/HeaderTitle';
export default {
    components: {
        'chrome-picker': Chrome,
        VueStar,
        HeaderTitle
    },
    props: {
        isIndex: {
            type: Boolean,
            default: true
        },
        gradientData: {
            type: Array,
            default: []
        },
        originGradientData: {
            type: Array,
            default: []
        }
    },
    data() {
        return {
            value8: 0,
            colors: {
                hex: '#194d3333',
                hsl: { h: 150, s: 0.5, l: 0.2, a: 1 },
                hsv: { h: 150, s: 0.66, v: 0.30, a: 1 },
                rgba: { r: 25, g: 77, b: 51, a: 1 },
                a: 1
            },
            
            name: '',
            select: {},
            limit: 3,
            errorTips: '',
            clipboard: {},
            timeout: {},
            oldTime: 0,
            target: ''
        }
    },
    updated() {
        this.resetInput()
    },
    mounted() {
        this.resetInput()

        window.onresize = () => {
            let width = document.documentElement.clientWidth
            // console.log(width)
            this.select = {}
            if (width+17 < 768) {
                this.limit = 1
            } else if (width+17 < 992 && width+17 > 768){
                this.limit = 2
            } else {
                this.limit = 3

            }
        }

    },
    
    methods: {
        reset(target) {
            let colorList = []
            this.originGradientData[target].colorList.forEach(item => {
                colorList.push(item)
            })
            this.gradientData[target].colorList = colorList

        },
        del(target, color) {
            // console.log(target,color)
            let colorLength = this.gradientData[target].colorList.length
            if(colorLength > 2) {
                this.gradientData[target].colorList.splice(color,1)
            } else {
                // this.$refs['errorTips'].style.dispaly = 'block'
                $('.error-tips').css('display', 'block')
                clearInterval(this.timeout)
                this.errorTips = '删除失败，渐变颜色最少须两个'
                this.timeout = setTimeout(() => {
                    $('.error-tips').css('display', 'none')
                }, 3000);
            }

        },
        close (target) {
            $(this.$refs[target][0].$el).css('display','none')
        },
        resetInput() {
            let input = Array.prototype.slice.call($('input.el-input__inner'))
            let leftSpan  = Array.prototype.slice.call($('.el-input-number__decrease'))
            let rightSpan  = Array.prototype.slice.call($('.el-input-number__increase'))
            // el-slider__input el-input-number
            let slider  = Array.prototype.slice.call($('.el-slider__input'))
            slider.forEach(item => {
                $(item).css('width','100px')
                $(item).css('margin-right','30px')
            })
            leftSpan.forEach(item => {
                $(item).css('border','none')
                $(item).css('background','#fff')
            })
            rightSpan.forEach(item => {
                $(item).css('border','none')
                $(item).css('background','#fff')
            })
            input.forEach(item => {
                $(item).css('border','none')
            })
        },
        background(index) {
            let color = ''
            let colorLength = this.gradientData[index].colorList.length
            // console.log(colorLength)
            this.gradientData[index].colorList.forEach(item => {
                if(colorLength > 1) {
                    color += item.color + ' ' + item.degree + '%,'
                } else if (colorLength == 1) {
                    color = item.color + ' ' + item.degree + '%,'
                } else {
                    color = 'white' + ' 0%,'
                }
            })
            // 去除最后得逗号
            color = color.substring(0, color.length-1)
            // console.log(color)
            return `background: linear-gradient(${this.gradientData[index].rotate}deg, ${color});`
        },
        selectNew(target,color) {
            // console.log(target,color)
            this.select.target = target
            this.select.color = color
            let name = 'picker' + target + color
            $(this.$refs[name][0].$el).css('display','block')
            this.name = name
            
        }, 
        updateValue() {
            
            let target = this.select.target
            let color = this.select.color
            
            let rgba = `rgba(${this.colors.rgba.r},${this.colors.rgba.g},${this.colors.rgba.b},${this.colors.rgba.a})`

            this.gradientData[target].colorList[color].color = rgba
        },
        addColor(target) {
            let colorLength = this.gradientData[target].colorList.length
            if( colorLength > 7) {
                $('.error-tips').css('display', 'block')
                this.errorTips = '增加失败，颜色数已超8个'
                clearInterval(this.timeout)
                this.timeout = setTimeout(() => {
                    $('.error-tips').css('display', 'none')
                }, 3000);
                return
            }
            this.gradientData[target].colorList.push({color: 'black', degree: 0})
        },
        show(target) {
            // 禁止连续点击
            let newTime = new Date().getTime()
            if( this.oldTime != 0 ) {
                if( parseInt(newTime) - parseInt(this.oldTime) < 600) {
                    return
                } else {
                    this.oldTime = parseInt(newTime)
                }               
            } else {
                this.oldTime = parseInt(newTime)
            }
            this.target = target
            // console.log(target)
            // 把下拉显示标签换成 隐藏标签
            // console.log(this.$refs[`hide${target}`])
            this.$refs[`show${target}`][0].style.display = 'none'
            this.$refs[`hide${target}`][0].style.display = 'block'
            // 显示编辑
            // 一个颜色div height 38px
            let length = this.gradientData[target].colorList.length + 1

            let h = length * 38 + 40 + 'px'
            // console.log(h)
            this.$refs[`edit${target}`][0].style.height = '0%'
            $(this.$refs[`edit${target}`][0]).animate({height: h,opacity: '1'},500)
            this.$refs[`edit${target}`][0].style.display = 'block'
            setTimeout(() => {
                this.$refs[`edit${target}`][0].style.height = h
            }, 500);
        },
        hide(target) {
            // 禁止连续点击
            let newTime = new Date().getTime()
            if( this.oldTime != 0 ) {
                if( parseInt(newTime) - parseInt(this.oldTime) < 600) {
                    return
                } else {
                    this.oldTime = parseInt(newTime)
                }               
            } else {
                this.oldTime = parseInt(newTime)
            }
            this.target = target
            // 把 隐藏标签 换成 下拉显示标签
            // console.log(this.$refs[`hide${target}`])
            this.$refs[`show${target}`][0].style.display = 'block'
            this.$refs[`hide${target}`][0].style.display = 'none'
            // 隐藏编辑
            $(this.$refs[`edit${target}`][0]).animate({opacity: '0', height: '0px'},300)
            setTimeout(() => {
                this.$refs[`edit${target}`][0].style.display = 'none'
                this.$refs[`edit${target}`][0].style.height = '0px'
            }, 300);
        },
        color(index) {
            let color = ''
            // console.log(colorLength)
            this.gradientData[index].colorList.forEach(item => {
                color += item.color + ' '
            })
            
            // console.log(color)
            return color
        },
        copyCss(target) {
            let copybtn = this.$refs.btnTips1[target]
            this.clipboard = new Clipboard(copybtn);
        },
        copyColor(target) {
            let copybtn = this.$refs.btnTips2[target]
            this.clipboard = new Clipboard(copybtn);
        },
        copyCssClick(target) {
            let copybtn = this.$refs.btnTips1[target]
            this.clipboard = new Clipboard(copybtn);

            let css = this.background(target)
            $('.error-tips').css('display', 'block')
            this.errorTips = '已复制Css到剪贴板'
            clearInterval(this.timeout)
            this.timeout = setTimeout(() => {
                $('.error-tips').css('display', 'none')
            }, 3000);
        },
        copyColorClick(target) {
            let copybtn = this.$refs.btnTips2[target]
            this.clipboard = new Clipboard(copybtn);
            let color = this.color(target)
            
            $('.error-tips').css('display', 'block')
            this.errorTips = '已复制Color到剪贴板'
            clearInterval(this.timeout)
            this.timeout = setTimeout(() => {
                $('.error-tips').css('display', 'none')
            }, 3000);
        }
    },
    watch: {
        name(newVal,oldVal) {
            if(oldVal) {
                $(this.$refs[oldVal][0].$el).css('display','none')
            }
        }
    }
}
</script>
<style lang="scss" scoped>


.gradient-box {
    margin-top: 10px;
}
.thumbnail {
    padding: 0;
    border: none;
    background-color: none;
    border-radius: 12px;
    // overflow: hidden;
}

.gradient {
    width: 100%;
    height: 220px;
    border-radius: 12px;
    overflow: hidden;
    position: relative;
    .copycss, .reset {
        position: absolute;
        
        cursor: pointer;
        display: none;
        i {
            font-size: 24px;
            color: rgba(255, 255, 255, 0.644);
            vertical-align: -3px;
        }
        span {
            font-size: 20px;
            color: #fff;
            display: none;
        }
    }
    .copycss:hover, .reset:hover {
        i {
            color: #fff;
        }
        span {
            display: inline;
        }
    }
    .copycss {
        left: 36%;
        top: 30%;
    }
    .reset {
        right: 15px;
        top: 15px;
    }
    
}
.gradient:hover {
    .reset {
        display: none;
    }
}

.reset {
    border: none !important;
}
.caption {
    padding: 0;
}
.block {
    padding-left: 10px;
    position: relative;
}
.colorList {
    position: relative;
    .del {
        position: absolute;
        right: 2px;
        top: 10px;
        color: #888;
        cursor: pointer;
    }
    .del:hover {
        color: rgb(231, 89, 89);
    }
    .color-item {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        border: none;
        position: absolute;
        top: 0;
        left: 0;
        margin-top: 8px;
    }
    .degreeSlider{
        margin-left: 70px;
    }
}

.rotateSlider {
    margin-left: 60px;
}
.tips {
    position: absolute;
    left: 30px;
    top: 10px;
    font-size: 14px;
    color: #888;
}
.rorate-item {
    width: 24px;
    height: 24px;
    border-radius: 50%;
    border: none;
    position: absolute;
    top: 0;
    left: 0;
    margin-top: 8px;
    background: #fff;
    border: 1px solid #eee;
}
.rorate-item::after {
    content: '|';
    width: 1px;
    height: 8px;
    color: #ccc;
    position: absolute;
    top: -3px;
    left: 10px;
}
.rotate {
    transform: rotate(0deg);
}
.picker {
    position: absolute;
    top: -100px;
    left: 36px;
    z-index: 99999;
}

.error-tips {

    display: none;
    .content {
        padding: 10px 20px;
        text-align: center;
        background-color: rgba(46, 46, 46, 0.76);
        position: fixed;
        left: 50%;
        top: 40%;
        transform: translate(-50%,-50%);
        z-index: 9999;
        border-radius: 8px;
        font-size: 16px;
        color: #fff;
    }
}

.edit {
    margin-top: 4px;
    height: 40px;
    .addColor {
        float: right;
        margin-right: 48%;
        .glyphicon-plus {
            color: rgba(59, 84, 230, 0.829);
            margin-bottom: 20px;
            margin-top: 10px;
            cursor: pointer;
        }
    }
}
.mini {
    display: flex;
    font-size: 18px;
    margin: 10px 4px;
    margin-right: 2px;
    .copy, .copyColor {
        flex: 2;
    }
    .show {
        flex: 1;
        text-align: right;
        i {
            color: #7B72E9;
            
        }
    }
    .copy, .copyColor, .show {
        i {
            cursor: pointer;
            color: rgba(43, 150, 250, 0.616);
            background-image:-webkit-linear-gradient(26deg,#CAE1FF,pink,#7A378B, #4169E1); 
            -webkit-background-clip:text; 
            -webkit-text-fill-color:transparent; 
        }
        span {
            cursor: pointer;
            display: none;
        }
        .glyphicon-chevron-up {
            display: none;
        }
    }
    .copyColor i {
        background-image:-webkit-linear-gradient(26deg,#7A378B,#FF7F50,#436EEE, #FF3030); 
        -webkit-background-clip:text; 
        -webkit-text-fill-color:transparent; 
    }
    .show i {
        background-image:-webkit-linear-gradient(90deg,#7A378B,#FFC0CB,#436EEE, #F08080); 
        -webkit-background-clip:text; 
        -webkit-text-fill-color:transparent; 
    }
    .copy:hover, .copyColor:hover, .show:hover{
        span {
            display: inline;
            color: rgb(43, 150, 250);
            background-image:-webkit-linear-gradient(26deg,#4169E1,pink,#7A378B, #4169E1); 
            -webkit-background-clip:text; 
            -webkit-text-fill-color:transparent; 
        }
        i {
            color: rgb(43, 150, 250);
        }
    }
}
.all-edit {
    display: none;
    // height: 0%;
    opacity: 0;
    // overflow: hidden;
    // animation: myfirst 1s;
    // -moz-animation: myfirst 1s;	/* Firefox */
    // -webkit-animation: myfirst 1s;	/* Safari 和 Chrome */
    // -o-animation: myfirst 1s;	/* Opera */
}
.height {
    height: 100%;
}
@keyframes myfirst {
    0%   {height: 0px;opacity: 0.1;}
    25%  {height: 138px;opacity: 0.3;}
    50%  {height: 80%;opacity: 0.6;}
    100% {height: 100%;opacity: 1;}
}
.css-value, .color-value{
    position: absolute;
    left: -10000%;
    top: -10000%;
}
.btn {
    background-color: #fff;
    font-size: 18px;
}
.btn:focus, .btn:active {
    outline: none;
    background-color: #fff;
    box-shadow: none;
}
.love {
    width: 36px;
    height: 36px;
}


</style>
