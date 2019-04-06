<template>
    <div>
        <div class="colorcard-box">
            <div class="container">
                <header-title v-if="isIndex" :title="'Color Card'" :isSwitch="true" @SwitchGrid="switchGrid()" :link="'/color'" ></header-title>
                <div class="row" v-if="!isCircle">
                    <div class="square-row col-sm-6 col-md-4" v-for="(item, index) in colorCard" :key="index">
                        <div class="card-header">
                            <div class="circle">
                                <span>{{item.num}}</span>
                            </div>
                            <div class="shadow">

                            </div>
                        </div>
                        <div class="thumbnail">
                            <!-- <div class="card-header">
                                <div class="circle">
                                    <span>{{index+1}}</span>
                                </div>
                            </div> -->
                            <div class="caption">
                                <div class="color-name">
                                    <div class="color-name-a" v-for="(color, i) in item.colorList" :key="i">
                                        <span>{{color}}</span>
                                    </div>
                                    <!-- <div class="color-name-b">
                                        <span>color</span>
                                    </div>
                                    <div class="color-name-c">
                                        <span>color</span>
                                    </div>
                                    <div class="color-name-d">
                                        <span>color</span>
                                    </div> -->
                                    
                                </div>
                                <div class="color">
                                    <div class="color-a" :style="{background: color}"  v-for="(color, i) in item.colorList" :key="i"></div>
                                    <!-- <div class="color-b" :style="{background: color}"></div>
                                    <div class="color-c" :style="{background: color}"></div>
                                    <div class="color-d" :style="{background: color}"></div> -->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cricle-row" v-if="isCircle">
                    <div class="cricle-row-item col-sm-12 col-md-6" v-for="(item, index) in colorCard" :key="index">
                        <div class="card-header">
                            <div class="circle">
                                <span>{{item.num}}</span>
                            </div>
                            <div class="shadow">

                            </div>
                        </div>
                        <div class="thumbnail">
                            
                            <div class="caption">
                                
                                <div class="color">
                                    <div :class="'color'+i" :style="{background: color}" v-for="(color, i) in item.colorList" :key="i"></div>
                                    <!-- <div class="color-b" :style="{background: color}"></div>
                                    <div class="color-c" :style="{background: color}"></div>
                                    <div class="color-d" :style="{background: color}"></div> -->
                                    
                                </div>
                                <div class="color-name">
                                    <div :class="'color-name'+i"  v-for="(color, i) in item.colorList" :key="i">
                                        <span>{{color}}</span>
                                    </div>
                                    <!-- <div class="color-name-b">
                                        <span>aaaaaa</span>
                                    </div>
                                    <div class="color-name-c">
                                        <span>aaaaaa</span>
                                    </div>
                                    <div class="color-name-d">
                                        <span>aaaaaa</span>
                                    </div> -->
                                    
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
import HeaderTitle from '@/components/HeaderTitle';
export default {
    props: {
        isIndex: {
            type: Boolean,
            default: true
        },
        colorCard: {
            type: Array,
            default: []
        },
        isCircle: {
            type: Boolean,
            default: true
        }
    },
    components: {
        HeaderTitle
    },
    data() {
        return {
            // isCircle: true
        }
    },
    mounted() {
    },
    methods: {
        switchGrid() {
            this.isCircle = !this.isCircle
        }
    }
}
</script>
<style lang="scss" scoped>
@media screen and (max-width: 992px){
    .cricle-row-item:nth-child(2n),.cricle-row-item:nth-child(2n+1) {
            padding: 0px !important;
        }
}
@media screen and (max-width: 768px){
    .cricle-row {
        .cricle-row-item {
            margin: 80px 0 !important;
            padding: 0px !important;
            transform: all .3s ease;
            .card-header {
                .circle {
                    top: -28px !important;
                    transform: all .3s ease;
                }
                .shadow {
                    top: 0px !important;
                    transform: all .3s ease;
                }
            }
        }
        
    }
    .row {
        .square-row {
            margin: 80px 0 !important;
            transform: all .3s ease;
            .card-header {
                .circle {
                    top: -28px !important;
                    transform: all .3s ease;
                }
                .shadow {
                    top: 0px !important;
                    transform: all .3s ease;
                }
            }
        }
        .thumbnail {
            .caption {
                .color {
                    height: 180px !important;
                    transform: all .3s ease;
                    
                }
                .color-name {
                    span {
                        font-size: 16px !important;
                        transform: all .3s ease;
                    }
                }
            }
        }
    }
    
}

@media screen and (max-width: 490px){
    .cricle-row {
        .cricle-row-item {
            margin: 80px 0 !important;
            padding: 0px !important;
            transform: all .3s ease;
            .card-header {
                .circle {
                    top: -28px !important;
                    transform: all .3s ease;
                }
                .shadow {
                    top: 0px !important;
                    transform: all .3s ease;
                }
            }
        }
        .thumbnail {
            .caption {
                .color {
                    height: 140px !important;
                    transform: all .3s ease;
                    div {
                        height: 120px !important;
                        width: 120px !important;
                        transform: all .3s ease;
                    }
                }
                .color-name {
                    span {
                        font-size: 16px !important;
                        transform: all .3s ease;
                    }
                }
            }
        }
    }
    .row {
        .square-row {
            margin: 80px 0 !important;
            transform: all .3s ease;
            .card-header {
                .circle {
                    top: -28px !important;
                    transform: all .3s ease;
                }
                .shadow {
                    top: 0px !important;
                    transform: all .3s ease;
                }
            }
        }
        .thumbnail {
            .caption {
                .color {
                    height: 140px !important;
                    transform: all .3s ease;
                    
                }
                .color-name {
                    span {
                        font-size: 16px !important;
                        transform: all .3s ease;
                    }
                }
            }
        }
    }
    
}
.colorcard-box {
    margin-top: 20px;
    .container {
        // background-color: #eee;
        position: relative;
        .colorcard-header {
            height: 40px;;
            font-size: 20px;
            color: #777;
            position: relative;
            .left {
                float: left;
                span {
                    background-image:-webkit-linear-gradient(111deg,blue,pink,red); 
                    -webkit-background-clip:text; 
                    -webkit-text-fill-color:transparent;
                    cursor: pointer; 
                }
                .bottomGradient {
                    margin-left: 35px;
                    border-radius: 20px;
                    width: 2px;
                    height: 4px;
                    background-image:-webkit-linear-gradient(111deg,blue,pink,red); 
                    animation:firstAnimate 6s infinite;
                }
            }
            .right {
                float: right;
                span {
                    background-image:-webkit-linear-gradient(155deg,#8968CD,rgba(5, 37, 131, 0.747),rgba(238, 101, 60, 0.884)); 
                    -webkit-background-clip:text; 
                    -webkit-text-fill-color:transparent; 
                    cursor: pointer;
                    animation: ballAnimate 3s infinite;
                }
                .switch-box {
                    float: left;
                    margin: 5px 10px 0 0;
                    background: -webkit-linear-gradient(0deg, red, blue);
                    width: 62px;
                    height: 16px;
                    border-radius: 15px;
                    animation: ballAnimate 3s infinite;
                        .switch {
                        height: 14px;
                        width: 60px;
                        border: 1px solid #eee;
                        background-color: #fff;
                        border-radius: 15px;
                        float: left;
                        margin: 1px;
                        position: relative;
                        cursor: pointer;
                        .ball {
                            background-image:-webkit-linear-gradient(20deg,blue,pink,red); 
                            height: 22px;
                            width: 22px;
                            border-radius: 50%;
                            position: absolute;
                            left: 10%;
                            top: -5px;
                            transform: all .9s ease; 
                            animation: ballAnimate 1s infinite;
                        }
                    }
                }
                
            }
        }

        .row {
            .card-header {
                // background-color: #aaa;
                position: relative;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                .circle {
                    position: absolute;
                    height: 60px;
                    line-height: 40px;
                    text-align: center;
                    width: 100px;
                    border-radius: 50%;
                    left: 50%;
                    top: -70%;
                    transform: translate(-50%);
                    background-color: #fff;
                    // box-shadow: 2px 5px 12px #ddd;
                    font-size: 22px;
                    font-weight: 700;
                    box-shadow: 0 0px 10px 0 rgba(153, 153, 155, 0.223), 0 0px 20px 0 rgba(194, 193, 231, 0.2) inset;
                    span {
                        background-image:-webkit-linear-gradient(90deg,#8968CD,rgba(5, 37, 131, 0.747)); 
                        -webkit-background-clip:text; 
                        -webkit-text-fill-color:transparent; 
                    }
                }
                .shadow {
                    width: 110px;
                    height: 34px;
                    position: absolute;
                    left: 50%;
                    top: 30px;
                    background: #fff;
                    transform: translate(-50%)
                }
            }
            .thumbnail {
                padding: 0;
                border-radius: 15px;
                border: none;
                box-shadow: 0 2px 20px 0 rgba(0, 0, 0, 0.15);
                margin: 30px 0;
                
                .caption {
                    padding: 0;
                    display: flex;
                    flex-direction: column;
                    .color-name {
                        height: 50px;
                        width: 100%;
                        // line-height: 30px;
                        text-align: center;
                        // background-color: #eee;
                        display: flex;
                        z-index: 999;
                        padding: 20px 0 10px 0;
                        span {
                            color: rgb(146, 91, 153); 
                            font-size: 16px;
                        }
                        div {
                            flex: 1;
                            height: 100%;
                        }
                    }
                    .color {
                        height: 180px;
                        width: 100%;
                        background-color: pink;
                        border-bottom-left-radius: 15px;
                        border-bottom-right-radius: 15px;
                        overflow: hidden;
                        // background-color: #eee;
                        display: flex;
                        
                        div {
                            flex: 1;
                            height: 100%;
                        }
                    }
                }
            }
        }
        .cricle-row {
            .cricle-row-item {
                position: relative;
            }
            .cricle-row-item:nth-child(2n+1) {
                padding-left: 0px;
            }
            .cricle-row-item:nth-child(2n) {
                padding-right: 0px;
            }
            .card-header {
                // background-color: #aaa;
                position: relative;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                .circle {
                    position: absolute;
                    height: 60px;
                    line-height: 40px;
                    text-align: center;
                    width: 100px;
                    border-radius: 50%;
                    left: 50%;
                    top: -70%;
                    transform: translate(-50%);
                    background-color: #fff;
                    // box-shadow: 2px 5px 12px #ddd;
                    font-size: 22px;
                    font-weight: 700;
                    box-shadow: 0 0px 10px 0 rgba(153, 153, 155, 0.223), 0 0px 20px 0 rgba(194, 193, 231, 0.2) inset;
                    span {
                        background-image:-webkit-linear-gradient(90deg,#8968CD,rgba(5, 37, 131, 0.747)); 
                        -webkit-background-clip:text; 
                        -webkit-text-fill-color:transparent; 
                    }
                }
                .shadow {
                    width: 110px;
                    height: 34px;
                    position: absolute;
                    left: 50%;
                    top: 30px;
                    background: #fff;
                    transform: translate(-50%)
                }
            }
            .thumbnail {
                padding: 0;
                border-radius: 15px;
                border: none;
                box-shadow: 0 2px 20px 0 rgba(0, 0, 0, 0.15);
                margin: 30px 0;
                // overflow: hidden;
                z-index: 999;
                
                .caption {
                    padding: 30px 0 10px 0;
                    display: flex;
                    flex-direction: column;
                    .color-name {
                        height: 30px;
                        width: 100%;
                        // line-height: 30px;
                        text-align: center;
                        // background-color: #eee;
                        // display: flex;
                        position: relative;
                        span {
                            color: #555; 
                            font-size: 18px;
                        }
                        div {
                            height: 20px;
                            width: 120px;
                            position: absolute;
                        }
                        div:nth-child(1) {
                            left: 20%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(2) {
                            left: 40%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(3) {
                            left: 60%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(4) {
                            left: 80%;
                            transform: translate(-50%);
                            top: 0;
                        }
                    }
                    .color {
                        height: 180px;
                        // background-color: pink;
                        border-bottom-left-radius: 15px;
                        border-bottom-right-radius: 15px;
                        overflow: hidden;
                        // background-color: #eee;
                        position: relative;
                        div {
                            height: 150px;
                            width: 150px;
                            border-radius: 50%;
                            position: absolute;
                            
                        }
                        div:nth-child(1) {
                            left: 20%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(2) {
                            left: 40%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(3) {
                            left: 60%;
                            transform: translate(-50%);
                            top: 0;
                        }
                        div:nth-child(4) {
                            left: 80%;
                            transform: translate(-50%);
                            top: 0;
                        }
                    }
                }
            }
        }
    }
}

</style>
