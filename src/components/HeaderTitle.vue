<template>
    <div class="header-title" :class="!isFloat ? 'center': ''">
        <div class="left" :class="isFloat ? 'floatLeft': 'center'">
            <span :style="!isFloat?'font-size: 26px;':''">{{title}}</span>
            <div class="bottomGradient" :style="!isFloat?'margin-top:10px;width:20%':''"></div>
        </div>
        <div class="right" >
            <div class="switch-box" v-if="isSwitch">
                <div class="switch" @click="switchGrid()">
                    <div class="ball" ref="ball"></div>
                </div>
            </div>
            <router-link  :to="link"><span v-if="isMore">More</span></router-link>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        title: {
            type: String
        },
        link: {
            type: String,
            default: ''
        },
        isSwitch: {
            type: Boolean,
            default: false
        },
        isMore: {
            type: Boolean,
            default: true
        },
        isFloat: {
            type: Boolean,
            default: true
        }
    },
    data() {
        return {
            isCircle: true
        }
    },
    methods: {
        switchGrid() {
            if (this.isCircle) {
                // this.$refs.ball.style.left = '55%'
                // background-image:-webkit-linear-gradient(20deg,blue,pink,red); 
                $(this.$refs.ball).animate({left: '55%',borderRadius: '10%'},300)
                this.isCircle = false
            } else {
                // this.$refs.ball.style.left = '10%'
                $(this.$refs.ball).animate({left: '10%',borderRadius: '50%'},300)
                this.isCircle = true
            }
            this.$emit('SwitchGrid',this.isCircle)
        }
    }
}
</script>
<style lang="scss" scoped>
.header-title {
    height: 40px;;
    font-size: 20px;
    color: #777;
    position: relative;
    margin-bottom: 40px;
    .left {
        
        span {
            background-image:-webkit-linear-gradient(111deg,blue,pink,red); 
            -webkit-background-clip:text; 
            -webkit-text-fill-color:transparent;
            cursor: pointer; 
        }
        .bottomGradient {
            margin-left: 35px;
            border-radius: 20px;
            width: 100%;
            height: 4px;
            background-image:-webkit-linear-gradient(111deg,blue,pink,red); 
            animation:firstAnimate 6s infinite;
        }
    }
    .floatLeft {
        float: left;
    }
    .center {
        text-align: center;
        margin-left: 20px;
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
a {
    text-decoration: none;
}
@keyframes firstAnimate {
    0% {background-image:-webkit-linear-gradient(111deg,rgba(0, 0, 255, 1),pink,rgba(255, 0, 0, 1)); width: 100%;margin-left: 0px;}
    10% {background-image:-webkit-linear-gradient(122deg,rgba(0, 0, 255, .9),pink,rgba(255, 0, 0, .9));}
    20% {background-image:-webkit-linear-gradient(133deg,rgba(0, 0, 255, .8),pink,rgba(255, 0, 0, .8));}
    30% {background-image:-webkit-linear-gradient(144deg,rgba(0, 0, 255, .7),pink,rgba(255, 0, 0, .7));}
    40% {background-image:-webkit-linear-gradient(155deg,rgba(0, 0, 255, .6),pink,rgba(255, 0, 0, .6));}
    50% {background-image:-webkit-linear-gradient(166deg,rgba(0, 0, 255, .5),pink,rgba(255, 0, 0, .5));width: 5px;margin-left: 50%;}
    60% {background-image:-webkit-linear-gradient(177deg,rgba(0, 0, 255, .4),pink,rgba(255, 0, 0, .4));}
    70% {background-image:-webkit-linear-gradient(188deg,rgba(0, 0, 255, .3),pink,rgba(255, 0, 0, .3));}
    80% {background-image:-webkit-linear-gradient(199deg,rgba(0, 0, 255, .4),pink,rgba(255, 0, 0, .4));}
    90% {background-image:-webkit-linear-gradient(211deg,rgba(0, 0, 255, .5),pink,rgba(255, 0, 0, .5));}
    100% {background-image:-webkit-linear-gradient(222deg,rgba(0, 0, 255, .6),pink,rgba(255, 0, 0, .6));width: 100%;margin-left: 0px;}
}
@keyframes ballAnimate {
    0% {background-image:-webkit-linear-gradient(36deg,rgba(0, 0, 255, 1),pink,rgba(255, 0, 0, 1));}
    10% {background-image:-webkit-linear-gradient(72deg,rgba(0, 0, 255, .9),pink,rgba(255, 0, 0, .9));}
    20% {background-image:-webkit-linear-gradient(108deg,rgba(0, 0, 255, .8),pink,rgba(255, 0, 0, .8));}
    30% {background-image:-webkit-linear-gradient(144deg,rgba(0, 0, 255, .7),pink,rgba(255, 0, 0, .7));}
    40% {background-image:-webkit-linear-gradient(180deg,rgba(0, 0, 255, .6),pink,rgba(255, 0, 0, .6));}
    50% {background-image:-webkit-linear-gradient(216deg,rgba(0, 0, 255, .5),pink,rgba(255, 0, 0, .5));}
    60% {background-image:-webkit-linear-gradient(252deg,rgba(0, 0, 255, .6),pink,rgba(255, 0, 0, .6));}
    70% {background-image:-webkit-linear-gradient(288deg,rgba(0, 0, 255, .7),pink,rgba(255, 0, 0, .7));}
    80% {background-image:-webkit-linear-gradient(324deg,rgba(0, 0, 255, .8),pink,rgba(255, 0, 0, .8));}
    90% {background-image:-webkit-linear-gradient(360deg,rgba(0, 0, 255, .9),pink,rgba(255, 0, 0, .9));}
    100% {background-image:-webkit-linear-gradient(36deg,rgba(0, 0, 255, 1),pink,rgba(255, 0, 0, 1));}
}
</style>
