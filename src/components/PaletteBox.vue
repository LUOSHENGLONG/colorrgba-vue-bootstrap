<template>
    <div class="color-palette">
        <div class="container">
            <header-title :title="'Color Palette'" :isFloat=false :isMore="false" ></header-title>
            <div class="color-palette-box">
                <div class="left">
                    <div class="colorBoard" :style="background">
                        
                    </div>
                </div>
                <div class="right">
                    <div class="edit">
                        
                        <div class="block">
                            <button class="size-item">
                                <i class="glyphicon glyphicon-resize-horizontal"></i>
                            </button>
                            <span class="tips">{{width}}%</span>
                            <el-slider
                                class="rotateSlider"
                                v-model="width"
                                :max=100
                                :min=1
                                show-input
                                >
                            </el-slider>
                                
                        </div>
                        <div class="block">
                            <button class="size-item">
                                <i class="glyphicon glyphicon-resize-vertical"></i>
                            </button>
                            <span class="tips">{{height}}px</span>
                            <el-slider
                                class="rotateSlider"
                                v-model="height"
                                :max=800
                                :min=1
                                show-input
                                >
                            </el-slider>
                                
                        </div>
                        <div class="block">
                            <button class="rorate-item rotate">
                                
                            </button>
                            <span class="tips">{{colorData.rotate}}°</span>
                            <el-slider
                                class="rotateSlider"
                                v-model="colorData.rotate"
                                :max=360
                                show-input
                                >
                            </el-slider>
                                
                        </div>
                        <div class="colorList" v-for="(colorList, index) in colorData.colorList" :key="index">
                            <button class="color-item" :style="{background: colorList.color}" :ref="'colorItem'+index" @click="selectNew(index)"></button>
                            <span class="tips">{{colorList.degree}}%</span>
                            <div class="degreeSlider">
                                <el-slider
                                    v-model="colorList.degree"
                                    :max=100
                                    :min=0
                                    show-input
                                    >
                                </el-slider>
                            </div>
                            <div class="del">
                                <i class="glyphicon glyphicon-remove" @click="del(index)"></i>
                            </div>
                            <div class="picker" @mouseleave="close('picker'+index)">
                                <chrome-picker v-model="colors" @input="updateValue()" :ref="'picker'+index" style="display:none;"></chrome-picker>
                            </div>
                        </div>
                        <div class="bottom-edit">
                            <div class="addColor">
                                <el-tooltip class="item" effect="dark" content="Add Color" placement="bottom" >
                                    <i class="glyphicon glyphicon-plus" @click="addColor()"></i>
                                </el-tooltip>
                            </div>
                            <!-- Copy -->
                            <div class="copy" >
                                <span ref="tqm" class="css-value" :id="'paletteCopyCss'" v-text="background"></span>
                                <el-tooltip class="item" effect="dark" content="Copy Css" placement="bottom" >
                                <button 
                                    @click="copyCssClick()"
                                    @mouseover="copyCss()"
                                    id="btnTips1" type="button" 
                                    class="copyCss btn" 
                                    data-toggle="popover" 
                                    title="" data-content="已复制"
                                    ref="btnTips1"
                                    :data-clipboard-target="'#paletteCopyCss'"
                                    style="padding-left:0px;"
                                >
                                    <i class="glyphicon glyphicon-paperclip"></i>
                                </button>
                                </el-tooltip>
                            </div>

                            <div class="copyColor" >
                                <span class="color-value" :id="'paletteColorTarget'" v-text="color"></span>
                                <el-tooltip class="item" effect="dark" content="Copy Color" placement="bottom" >
                                <button 
                                    @click="copyColorClick()"
                                    @mouseover="copyColor()"
                                    id="btnTips2" type="button" 
                                    class="copyCss btn" 
                                    data-toggle="popover" 
                                    title="" data-content="已复制"
                                    ref="btnTips2"
                                    :data-clipboard-target="'#paletteColorTarget'"
                                    
                                >
                                    <i class="glyphicon glyphicon-link"></i>
                                </button>
                                </el-tooltip>
                            </div>

                            <div class="reset">
                                <el-tooltip class="item" effect="dark" content="Reset" placement="bottom" >
                                    <i class="glyphicon glyphicon-repeat"  @click="reset"></i>
                                </el-tooltip>
                            </div>
                            <div class="switch">
                                <el-tooltip class="item" effect="dark" content="Switch" placement="bottom" >
                                    <i v-if="!full" class="glyphicon glyphicon-resize-full"  @click="switchSize"></i>
                                    <i  v-if="full" class="glyphicon glyphicon-resize-small"  @click="switchSize"></i>
                                </el-tooltip>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="color-palette-error-tips" ref="errorTips">
            <div class="content">
                {{ errorTips }}
            </div>
        </div>
    </div>
</template>

<script>
import { Chrome } from 'vue-color'
import Clipboard from 'clipboard';
import HeaderTitle from '@/components/HeaderTitle';
export default {
    
    components: {
        'chrome-picker': Chrome,
        HeaderTitle
    },
    data() {
        return {
            colorData: {
                rotate: 0,
                colorList: [
                    {color: 'blue', degree: 0},
                    {color: 'pink', degree: 100},
                ]
            },
            originColorData: {
                rotate: 0,
                colorList: [
                    {color: 'blue', degree: 0},
                    {color: 'pink', degree: 100},
                ]
            },
            colors: {
                hex: '#194d3333',
                hsl: { h: 150, s: 0.5, l: 0.2, a: 1 },
                hsv: { h: 150, s: 0.66, v: 0.30, a: 1 },
                rgba: { r: 25, g: 77, b: 51, a: 1 },
                a: 1
            },
            name: '',
            select: {},
            errorTips: '',
            clipboard: {},
            timeout: {},
            width: 100,
            height: 440,
            full: true
        }
    },
    computed: {
        background() {
            let color = ''
            let colorLength = this.colorData.colorList.length
            // console.log(colorLength)
            this.colorData.colorList.forEach(item => {
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
            // console.log(color)
            return `background: linear-gradient(${this.colorData.rotate}deg, ${color});width:${this.width}%;height:${this.height}px`
        },
        color() {
            let color = ''
            // console.log(colorLength)
            this.colorData.colorList.forEach(item => {
                color += item.color + ' '
            })
            
            // console.log(color)
            return color
        },
    },
    mounted() {
        this.resetInput()
    },
    updated() {
        this.resetInput()
    },
    methods: {
        switchSize() {
            if(this.full) {
                $('.color-palette-box').css('flex-direction','row')
                $('.bottom-edit').css('bottom','10px')
                this.full = false
            } else {
                
                $('.color-palette-box').css('flex-direction','column')
                $('.bottom-edit').css('bottom','0')
                this.full = true
            }
        },
        reset() {
            let colorList = []
            this.originColorData.colorList.forEach(item => {
                colorList.push(item)
            })
            this.colorData.colorList = colorList
        },
        close(target) {
            $(this.$refs[target][0].$el).css('display','none')
        },
        del(index) {
            let colorLength = this.colorData.colorList.length
            if(colorLength > 2) {
                this.colorData.colorList.splice(index,1)
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
        addColor() {
            let colorLength = this.colorData.colorList.length
            if( colorLength > 7) {
                $('.color-palette-error-tips').css('display', 'block')
                this.errorTips = '增加失败，颜色数已超8个'
                clearInterval(this.timeout)
                this.timeout = setTimeout(() => {
                    $('.color-palette-error-tips').css('display', 'none')
                }, 3000);
                return
            }
            this.colorData.colorList.push({color: 'black', degree: 0})

        },
        updateValue() {
            let index = this.select.index
            
            let rgba = `rgba(${this.colors.rgba.r},${this.colors.rgba.g},${this.colors.rgba.b},${this.colors.rgba.a})`

            this.colorData.colorList[index].color = rgba
        },
        selectNew(index) {
            this.select.index = index
            
            let name = 'picker' + index
            $(this.$refs[name][0].$el).css('display','block')
            this.name = name
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
        copyCss() {
            let copybtn = this.$refs.btnTips1
            this.clipboard = new Clipboard(copybtn);
        },
        copyColor() {
            let copybtn = this.$refs.btnTips2
            this.clipboard = new Clipboard(copybtn);
        },
        copyCssClick() {
            let copybtn = this.$refs.btnTips1
            this.clipboard = new Clipboard(copybtn);
            let color = ''
            let colorLength = this.colorData.colorList.length
            // console.log(colorLength)
            this.colorData.colorList.forEach(item => {
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
            // console.log(color)
            let css = `background: linear-gradient(${this.colorData.rotate}deg, ${color});`

            $('.color-palette-error-tips').css('display', 'block')
            this.errorTips = '已复制Css到剪贴板'
            clearInterval(this.timeout)
            this.timeout = setTimeout(() => {
                $('.color-palette-error-tips').css('display', 'none')
            }, 3000);
        },
        copyColorClick() {
            let copybtn = this.$refs.btnTips2
            this.clipboard = new Clipboard(copybtn);
            let color = ''
            // console.log(colorLength)
            this.colorData.colorList.forEach(item => {
                color += item.color + ' '
            })
            
            
            $('.color-palette-error-tips').css('display', 'block')
            this.errorTips = '已复制Color到剪贴板'
            clearInterval(this.timeout)
            this.timeout = setTimeout(() => {
                $('.color-palette-error-tips').css('display', 'none')
            }, 3000);
        },
        
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
@media screen and (max-width: 992px){
    .color-palette-box {
        flex-direction: column !important;
        .right {
            margin-left: 0 !important;
        }
    }
}
.color-palette {
    .container {
        .color-palette-box {
            display: flex;
            flex-direction: column;
            margin: 40px 0 40px 0;
            .left {
                margin-bottom: 30px;
                flex: 2;
                .colorBoard {
                    width: 100%;
                    border-radius: 15px;
                }
            }
            .right {
                min-height: 450px;
                flex: 1;
                margin-left: 20px;
                margin-top: -8px; 
                position: relative;
            }
        }
    }
}



.block {
    position: relative;
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
.size-item {
    width: 24px;
    height: 24px;
    border: none;
    position: absolute;
    top: 0;
    left: 0;
    margin-top: 8px;
    background: #fff;
    border-radius: 50%;
    i {
        color: #666;
    }
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
.tips {
    position: absolute;
    left: 30px;
    top: 10px;
    font-size: 14px;
    color: #888;
}

.rotateSlider {
    margin-left: 80px;
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
        margin-left: 80px;
    }
}

.picker {
    position: absolute;
    top: -100px;
    left: 36px;
    z-index: 99999;
}
.bottom-edit {
    position: absolute;
    right: 0;
    bottom: 10px;
    height: 40px;
    width: 100%;
    .addColor {
        position: absolute;
        right: 0%;
        bottom: -5px;
        .glyphicon-plus {
            color: rgba(59, 84, 230, 0.829);
            margin-bottom: 20px;
            margin-top: 10px;
            cursor: pointer;
        }
        span {
            display: none;
        }
    }
    .copy {
        position: absolute;
        bottom: 8px;
        right: 30px;
        .btn {
            background-color: #fff;
            padding: 0;
        }
        .btn:focus, .btn:active {
            outline: none;
            box-shadow: none;
        }
        i{
            color: #555;
        }
        
    }
    .copyColor {
        position: absolute;
        bottom: 9px;
        right: 65px;
        .btn {
            background-color: #fff;
            padding: 0;
        }
        .btn:focus, .btn:active {
            outline: none;
            box-shadow: none;
        }
        i{
            color: #555;
        }
        
    }
    .reset {
        position: absolute;
        bottom: 10px;
        right: 100px;
        cursor: pointer;
        .btn {
            background-color: #fff;
        }
        i{
            color: #555;
        }
    }
    .switch {
        position: absolute;
        bottom: 10px;
        right: 134px;
        cursor: pointer;
        .btn {
            background-color: #fff;
        }
        i{
            color: #555;
        }
    }
}

.color-palette-error-tips {
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

.css-value, .color-value{
    position: absolute;
    left: -10000%;
    top: -10000%;
}
</style>
